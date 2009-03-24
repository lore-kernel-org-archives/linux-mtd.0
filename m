Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm2Q1-0003JS-BP
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 08:55:39 +0000
Date: Tue, 24 Mar 2009 09:55:30 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
Message-ID: <20090324085530.GA21444@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1237874727.14602.95.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2009-03-24 08:05:27 [+0200]:

>On Mon, 2009-03-23 at 23:42 +0100, Sebastian Andrzej Siewior wrote:
>> this is difficult because it depends on CONFIG_JFFS2_FS_WRITEBUFFER
>> 
>> Signed-off-by: Sebastian Andrzej Siewior <sebastian at breakpoint.cc>
>> ---
>>  flash_eraseall.c |   14 +++++++++++++-
>>  1 files changed, 13 insertions(+), 1 deletions(-)
>> 
>> diff --git a/flash_eraseall.c b/flash_eraseall.c
>> index 0a4010e..3591db5 100644
>> --- a/flash_eraseall.c
>> +++ b/flash_eraseall.c
>> @@ -64,12 +64,24 @@ static int prepare_clean_marker(mtd_info_t *meminfo)
>>  
>>  	cleanmarker.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
>>  	cleanmarker.nodetype = cpu_to_je16(JFFS2_NODETYPE_CLEANMARKER);
>> +	cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
>>  
>>  	switch (meminfo->type) {
>>  	case MTD_ROM:
>>  	case MTD_RAM:
>> +		break;
>> +
>>  	case MTD_NORFLASH:
>> -		cleanmarker.totlen = cpu_to_je32(sizeof(struct jffs2_unknown_node));
>> +		/* only if the kernel is compiled with
>> +		 * CONFIG_JFFS2_FS_WRITEBUFFER
>> +		 * Now, how to check that?
>> +		 */
>> +		if (!(meminfo->flags & MTD_BIT_WRITEABLE)) {
>> +			int l;
>> +
>> +			l = meminfo->writesize > 16 ? meminfo->writesize : 16;
>> +			cleanmarker.totlen = cpu_to_je32(l);
>> +		}
>
>Sorry, not sure which problem this patch is trying to solve?
CONFIG_JFFS2_FS_WRITEBUFFER enabled and MTD_BIT_WRITEABLE missing in
flags.
This is from jffs2_nor_wbuf_flash_setup() which is only executed if
jffs2_nor_wbuf_flash() evaluates 1 which is only the case if
CONFIG_JFFS2_FS_WRITEBUFFER is enabled and MTD_BIT_WRITEABLE is not
available in flags.
So to this write, we have to evaluate CONFIG_JFFS2_FS_WRITEBUFFER, don't
we?

>Best regards,
>Artem Bityutskiy (???????? ?????)

Sebastian
