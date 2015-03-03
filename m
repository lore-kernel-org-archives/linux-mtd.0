Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YStkX-0007Py-Lh
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 20:49:06 +0000
Received: by igqa13 with SMTP id a13so31445513igq.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 12:48:44 -0800 (PST)
In-Reply-To: <1425411864.3359.78.camel@infradead.org>
References: <1425409389-21613-1-git-send-email-fabf@skynet.be>
 <1425411864.3359.78.camel@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [PATCH 1/1 linux-next] jffs2: remove multiple dereferences in
 debug
From: Nicholas Krause <xerofoify@gmail.com>
Date: Tue, 03 Mar 2015 15:48:36 -0500
To: David Woodhouse <dwmw2@infradead.org>,Fabian Frederick <fabf@skynet.be>
Message-ID: <1388AA20-9BE3-4EA1-AB28-A530A877585E@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On March 3, 2015 2:44:24 PM EST, David Woodhouse <dwmw2@infradead.org> wrote:
>On Tue, 2015-03-03 at 20:03 +0100, Fabian Frederick wrote:
>> use jffs2_eraseblock variables to simplify the code
>
>That looks more like it's obfuscating the code to me. Now you have to
>look up a few lines to see what the 'nextb' and 'gcb' variables
>actually
>point to.
>
>It doesn't even make it easier to read — if there were long lines with
>complex formulæ it might make some sense, but in this case I think
>there's really no point in this change.
>
I have  to agree with maintainer too as after reading the patch I found the code harder to understand too. 
Nick 
>
>> Signed-off-by: Fabian Frederick <fabf@skynet.be>
>> ---
>>  fs/jffs2/debug.c |   26 ++++++++++++++------------
>>  1 file changed, 14 insertions(+), 12 deletions(-)
>> 
>> diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
>> index 1090eb6..2ddb967 100644
>> --- a/fs/jffs2/debug.c
>> +++ b/fs/jffs2/debug.c
>> @@ -160,26 +160,28 @@ __jffs2_dbg_prewrite_paranoia_check(struct
>jffs2_sb_info *c,
>>  void __jffs2_dbg_superblock_counts(struct jffs2_sb_info *c)
>>  {
>>  	struct jffs2_eraseblock *jeb;
>> +	struct jffs2_eraseblock *gcb = c->gcblock;
>> +	struct jffs2_eraseblock *nextb = c->nextblock;
>>  	uint32_t free = 0, dirty = 0, used = 0, wasted = 0,
>>  		erasing = 0, bad = 0, unchecked = 0;
>>  	int nr_counted = 0;
>>  	int dump = 0;
>>  
>> -	if (c->gcblock) {
>> +	if (gcb) {
>>  		nr_counted++;
>> -		free += c->gcblock->free_size;
>> -		dirty += c->gcblock->dirty_size;
>> -		used += c->gcblock->used_size;
>> -		wasted += c->gcblock->wasted_size;
>> -		unchecked += c->gcblock->unchecked_size;
>> +		free += gcb->free_size;
>> +		dirty += gcb->dirty_size;
>> +		used += gcb->used_size;
>> +		wasted += gcb->wasted_size;
>> +		unchecked += gcb->unchecked_size;
>>  	}
>> -	if (c->nextblock) {
>> +	if (nextb) {
>>  		nr_counted++;
>> -		free += c->nextblock->free_size;
>> -		dirty += c->nextblock->dirty_size;
>> -		used += c->nextblock->used_size;
>> -		wasted += c->nextblock->wasted_size;
>> -		unchecked += c->nextblock->unchecked_size;
>> +		free += nextb->free_size;
>> +		dirty += nextb->dirty_size;
>> +		used += nextb->used_size;
>> +		wasted += nextb->wasted_size;
>> +		unchecked += nextb->unchecked_size;
>>  	}
>>  	list_for_each_entry(jeb, &c->clean_list, list) {
>>  		nr_counted++;

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
