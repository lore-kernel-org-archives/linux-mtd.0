Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD1Bw-0004lo-Ky
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 02:04:01 +0000
Message-ID: <559DD61C.3010505@huawei.com>
Date: Thu, 9 Jul 2015 10:02:04 +0800
From: Wei Fang <fangwei1@huawei.com>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>, Brian Norris
 <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 "dedekind1@gmail.com >> Artem Bityutskiy" <dedekind1@gmail.com>
Subject: Re: [PATCH] jffs2: remove unneeded conditions
References: <558E59C9.2070207@huawei.com>
 <20150707201843.GH18370@brian-ubuntu> <559C80B9.8060200@huawei.com>
In-Reply-To: <559C80B9.8060200@huawei.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian and Sheng,

On 2015/7/8 9:45, Sheng Yong wrote:
> On 7/8/2015 4:18 AM, Brian Norris wrote:
>> Huh? This comment doesn't exactly make sense to me. It seems like when
>> reasoning about a safety check, you're assuming the safety check will
>> already pass. Can you elaborate your reasoning here?

Hmm, I think my poor comment confused you:(.
As we known, len >= JFFS2_MIN_NODE_HEADER, and depending on that point,
my reasoning is like this:
 len < X   JFFS2_MIN_NODE_HEADER < X   JFFS2_MIN_NODE_HEADER < X && len < X
 if true	must be true			 true
 if false	don't care			 false
so the final result can be decided by "len < X", and I thought
"JFFS2_MIN_NODE_HEADER < X" is unneeded.

Do I miss something?
Yes. Thanks to you, I realized that "JFFS2_MIN_NODE_HEADER < X" can be judged
by compiler, and if false, the scope of if would be ignored by compiler. So
this comparison is very useful!

>> Also, did you test these changes? Are you solving any real problem?
>>
>>> Signed-off-by: Wei Fang <fangwei1@huawei.com>
>>> ---
>>>  fs/jffs2/readinode.c | 9 +++------
>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
>>> index dddbde4..b9bd3ad 100644
>>> --- a/fs/jffs2/readinode.c
>>> +++ b/fs/jffs2/readinode.c
>>> @@ -1059,8 +1059,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>>>
>>>  		case JFFS2_NODETYPE_DIRENT:
>>>
>>> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent) &&
>>
>> ^^ The original comparison here is kind of strange. I see:
>>
>> #define JFFS2_MIN_NODE_HEADER sizeof(struct jffs2_raw_dirent)
>>
>> which means that we're comparing:
>>
>> 			if (sizeof(struct jffs2_raw_dirent) < sizeof(struct jffs2_raw_dirent) && ...)
>>
>> AFAIK, that comparison will *always* be false, and so the entire
>> condition will always be false. Not sure if that's intentional.
> According to the comment,
> 	"At this point we don't know the type of the node we're going
> 	 to read, so we do not know the size of its header. In order
> 	 to minimize the amount of flash IO we assume the node has
> 	 size = JFFS2_MIN_NODE_HEADER."
> in order to save overhead of flash IO, jffs2 reads JFFS2_MIN_NODE_HEADER
> bytes first. This is enough to detect the node type. IMO, for node whose
> type is JFFS2_NODETYPE_DIRENT, there is no need to read more, so the whole
> block of if statement can be removed.

When we do some changes to the node type structures, JFFS2_MIN_NODE_HEADER
may be redefined, and the result of this comparison will be changed.
Though jffs2 is very stable, and changes to structures on flash won't
happen, I still think remaining this kind of comparison can make the
code more readable and maintainable.
Whatever, as I said, this scope of if can be ignored by compiler,
removing it doesn't make any sense.

> 
> And as Brain said, the modification needs some test.
> 
> thanks,
> Sheng
>>
>>> -			    len < sizeof(struct jffs2_raw_dirent)) {
>>> +			if (len < sizeof(struct jffs2_raw_dirent)) {
>>
>> Therefore, the "refactoring" you are doing seems to actually make a
>> logical change. If nothing else, it makes it harder (likely impossible)
>> for the compiler to reason that the conditional code is all dead code.
>> I'm not sure if that's a good or a bad thing, as I haven't figured out
>> the full intent of this code in the first place.
>>
>>>  				err = read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf);
>>>  				if (unlikely(err))
>>>  					goto free_out;
>>> @@ -1074,8 +1073,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>>>
>>>  		case JFFS2_NODETYPE_INODE:
>>>
>>> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode) &&
>>> -			    len < sizeof(struct jffs2_raw_inode)) {
>>> +			if (len < sizeof(struct jffs2_raw_inode)) {
>>>  				err = read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf);
>>>  				if (unlikely(err))
>>>  					goto free_out;
>>> @@ -1088,8 +1086,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>>>  			break;
>>>
>>>  		default:
>>> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node) &&
>>> -			    len < sizeof(struct jffs2_unknown_node)) {
>>> +			if (len < sizeof(struct jffs2_unknown_node)) {
>>>  				err = read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf);
>>>  				if (unlikely(err))
>>>  					goto free_out;
>>
>> At any rate, I'm not confident in this patch without a lot more
>> explanation, so I will not be taking it as-is.

Please ignore this patch. Adding comment to "JFFS2_MIN_NODE_HEADER < X"
may be useful:).

Thanks,
Wei

>>
>> Thanks,
>> Brian
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>>
