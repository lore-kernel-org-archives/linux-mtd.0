Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oi3jn-0003t5-CM
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 11:08:20 +0000
Message-ID: <4C5E901E.5060802@nokia.com>
Date: Sun, 08 Aug 2010 14:08:14 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv2 7/9] UBIFS: do not write rubbish into truncation scanning
	node
References: <1281261452-9868-1-git-send-email-dedekind1@gmail.com>
	<1281261452-9868-8-git-send-email-dedekind1@gmail.com>
	<4C5E8F15.9080505@nokia.com>
In-Reply-To: <4C5E8F15.9080505@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Hunter wrote:
> Artem Bityutskiy wrote:
>> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>>
>> In the scanning code, in 'ubifs_add_snod()', we write rubbish into
>> 'snod->key', because we assume that on-flash truncation nodes have a key, but
>> they do not. If the other parts of UBIFS then mistakenly try to look-up
>> the truncation node key (they should not do this, but may do because of a bug),
>> we can succeed and corrupt TNC. It looks like we did have such a situation in
>> 'sort_nodes()' in gc.c.
>>
>> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>> ---
>>  fs/ubifs/scan.c |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
>> index 96c5253..a0a305c 100644
>> --- a/fs/ubifs/scan.c
>> +++ b/fs/ubifs/scan.c
>> @@ -212,7 +212,6 @@ int ubifs_add_snod(const struct ubifs_info *c, struct ubifs_scan_leb *sleb,
>>  	case UBIFS_DENT_NODE:
>>  	case UBIFS_XENT_NODE:
>>  	case UBIFS_DATA_NODE:
>> -	case UBIFS_TRUN_NODE:
> 
> There is another bug in ubifs_recover_size_accum() that expects a truncate node
> to have a key.  That would be fixed by using trun_key_init() here.

No I was wrong, the key in ubifs_recover_size_accum() is already created using
trun_key_init()

Still, trun_key_init might be better here because the all-zeroes key has a key-type
of UBIFS_INO_KEY.  What do you think?

> 
>>  		/*
>>  		 * The key is in the same place in all keyed
>>  		 * nodes.
> 
> 
