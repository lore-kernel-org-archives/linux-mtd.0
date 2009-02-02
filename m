Message-ID: <4986D3F6.5030208@nokia.com>
Date: Mon, 02 Feb 2009 13:07:34 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: Regarding UBI scalability
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
In-Reply-To: <618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"brij.singh@samsung.com" <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amit Kumar Sharma wrote:
> Hi
> ----- Original Message -----
> From: "Artem Bityutskiy" <dedekind@infradead.org>
> To: <brij.singh@samsung.com>
> Cc: <linux-mtd@lists.infradead.org>
> Sent: Monday, February 02, 2009 3:01 PM
> Subject: Re: Regarding UBI scalability
> 
> 
>> On Fri, 2009-01-30 at 12:45 +0000, BRIJESH SINGH wrote:
>>> Hi,
>>>     I have gone through UBI documentation which clearly
>>> mentions that
>>> UBI doesn't scale very well.(Boot time and Memory
>>> consumption
>>> increases with size of device.)This is very similar to
>>> JFFS2
>>> scalability issues. Log, journal(like UBIFS LPT)
>>> combination might
>>> surely help on this issue.
>> Right
>>
>>>   I would like to work on this enhancement with the
>>> community. Before
>>> that I just wanted to check if any one is already working
>>> on it.
>> No, I do not think so.
>>
>>>   As this a well known issue, I am sure somebody will
>>> have some design
>>> suggestions. Any design suggestions will be appreciated.
>> You could look at the old JFFS3 design document:
>>
>> http://www.linux-mtd.infradead.org/doc/JFFS3design.pdf
>>
>> at the "The superblock" section, which describes the idea
>> of how to have
>> a data structure which refers everything else in the
>> media: journal,
>> root nodes of the trees, etc.
>>
>> An then you should think about how to store the EBA table
>> on flash. And
>> how to store the erase counters on the flash. Many ideas
>> may be borrowed
>> from UBIFS in this area.
>>
>> I may help you in terms of design suggestions / review,
>> and some code
>> review. But I do not really have time to seriously work on
>> this.
>>
>> --
>> Best regards,
>> Artem Bityutskiy (???????? ?????)
> 
> Thanks for your comments Brijesh will check all your
> suggestion and we will discuss final design with you for
> your comments.
> 
> Thanks
> Amit

I would suggest an intermediate step.  Create UBI2 which is
similar to UBI but stores eraseblock information in one place,
instead of at the beginning of each eraseblock.  Such an approach
might be OK up to as much as 64GiB, and would probably perform
better than a fully scalable version.

Then look at creating UBI3, which is fully scalable.
