Message-ID: <559C80B9.8060200@huawei.com>
Date: Wed, 8 Jul 2015 09:45:29 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, Wei Fang <fangwei1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>,
 "dedekind1@gmail.com >> Artem Bityutskiy" <dedekind1@gmail.com>
Subject: Re: [PATCH] jffs2: remove unneeded conditions
References: <558E59C9.2070207@huawei.com> <20150707201843.GH18370@brian-ubuntu>
In-Reply-To: <20150707201843.GH18370@brian-ubuntu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brain and Wei Fang,

#CCed Artem Bityutskiy.

On 7/8/2015 4:18 AM, Brian Norris wrote:
> Hi Wei,
> 
> On Sat, Jun 27, 2015 at 04:07:37PM +0800, Wei Fang wrote:
>> Since len must not be smaller than JFFS2_MIN_NODE_HEADER, if
>> "len < X" is true, than "JFFS2_MIN_NODE_HEADER < X" must be true,
>> so it can be removed.
> 
> Huh? This comment doesn't exactly make sense to me. It seems like when
> reasoning about a safety check, you're assuming the safety check will
> already pass. Can you elaborate your reasoning here?
> 
> Also, did you test these changes? Are you solving any real problem?
> 
>> Signed-off-by: Wei Fang <fangwei1@huawei.com>
>> ---
>>  fs/jffs2/readinode.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
>> index dddbde4..b9bd3ad 100644
>> --- a/fs/jffs2/readinode.c
>> +++ b/fs/jffs2/readinode.c
>> @@ -1059,8 +1059,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>>
>>  		case JFFS2_NODETYPE_DIRENT:
>>
>> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent) &&
> 
> ^^ The original comparison here is kind of strange. I see:
> 
> #define JFFS2_MIN_NODE_HEADER sizeof(struct jffs2_raw_dirent)
> 
> which means that we're comparing:
> 
> 			if (sizeof(struct jffs2_raw_dirent) < sizeof(struct jffs2_raw_dirent) && ...)
> 
> AFAIK, that comparison will *always* be false, and so the entire
> condition will always be false. Not sure if that's intentional.
According to the comment,
	"At this point we don't know the type of the node we're going
	 to read, so we do not know the size of its header. In order
	 to minimize the amount of flash IO we assume the node has
	 size = JFFS2_MIN_NODE_HEADER."
in order to save overhead of flash IO, jffs2 reads JFFS2_MIN_NODE_HEADER
bytes first. This is enough to detect the node type. IMO, for node whose
type is JFFS2_NODETYPE_DIRENT, there is no need to read more, so the whole
block of if statement can be removed.

And as Brain said, the modification needs some test.

thanks,
Sheng
> 
>> -			    len < sizeof(struct jffs2_raw_dirent)) {
>> +			if (len < sizeof(struct jffs2_raw_dirent)) {
> 
> Therefore, the "refactoring" you are doing seems to actually make a
> logical change. If nothing else, it makes it harder (likely impossible)
> for the compiler to reason that the conditional code is all dead code.
> I'm not sure if that's a good or a bad thing, as I haven't figured out
> the full intent of this code in the first place.
> 
>>  				err = read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf);
>>  				if (unlikely(err))
>>  					goto free_out;
>> @@ -1074,8 +1073,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>>
>>  		case JFFS2_NODETYPE_INODE:
>>
>> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode) &&
>> -			    len < sizeof(struct jffs2_raw_inode)) {
>> +			if (len < sizeof(struct jffs2_raw_inode)) {
>>  				err = read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf);
>>  				if (unlikely(err))
>>  					goto free_out;
>> @@ -1088,8 +1086,7 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>>  			break;
>>
>>  		default:
>> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node) &&
>> -			    len < sizeof(struct jffs2_unknown_node)) {
>> +			if (len < sizeof(struct jffs2_unknown_node)) {
>>  				err = read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf);
>>  				if (unlikely(err))
>>  					goto free_out;
> 
> At any rate, I'm not confident in this patch without a lot more
> explanation, so I will not be taking it as-is.
> 
> Thanks,
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
