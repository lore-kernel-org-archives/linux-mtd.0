Message-ID: <49896448.20407@nokia.com>
Date: Wed, 04 Feb 2009 11:47:52 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "brij.singh@samsung.com" <brij.singh@samsung.com>
Subject: Re: Regarding UBI scalability
References: <7824366.270131233573513030.JavaMail.weblogic@epml10>
In-Reply-To: <7824366.270131233573513030.JavaMail.weblogic@epml10>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: AMIT KUMARSHARMA <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext BRIJESH SINGH wrote:
> Hi,
> 
> Artem Bityutskiy wrote:
>> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
>>> I would suggest an intermediate step.  Create UBI2 which is
>>> similar to UBI but stores eraseblock information in one place,
>>> instead of at the beginning of each eraseblock.  Such an approach
>>> might be OK up to as much as 64GiB, and would probably perform
>>> better than a fully scalable version.
>>>
>>> Then look at creating UBI3, which is fully scalable.
>> Yes, I assume UBI2 should store mapping/erasure information in separate
>> tables, not in each eraseblock. So we should get rid of eraseblock
>> headers.
> 
> Yes that is what I meant.  You could probably make do with as little as
> 12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
> would need 1536KiB table, which could be read in a second or two, so
> mount time is OK.
> 
> I have an idea for how to update the table relatively efficiently if you
> are interested.
> 
> I am definitely interested. But apart from on flash headers, I am also interested in memory consumption scaling.
> UBIFS solved this problem quite interestingly. Can something similar be borrowed for UBI?
> 
> Thanks and Regards,
> Brijesh

I would leave the memory consumption issue for UBI3.

Do you have a target memory consumption in mind?
