Message-ID: <4986D677.3020500@nokia.com>
Date: Mon, 02 Feb 2009 13:18:15 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "dedekind@infradead.org" <dedekind@infradead.org>
Subject: Re: Regarding UBI scalability
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>	
	<1233567078.7085.62.camel@localhost.localdomain>	
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>	
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
In-Reply-To: <1233572259.7085.64.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"brij.singh@samsung.com" <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
>> I would suggest an intermediate step.  Create UBI2 which is
>> similar to UBI but stores eraseblock information in one place,
>> instead of at the beginning of each eraseblock.  Such an approach
>> might be OK up to as much as 64GiB, and would probably perform
>> better than a fully scalable version.
>>
>> Then look at creating UBI3, which is fully scalable.
> 
> Yes, I assume UBI2 should store mapping/erasure information in separate
> tables, not in each eraseblock. So we should get rid of eraseblock
> headers.

Yes that is what I meant.  You could probably make do with as little as
12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
would need 1536KiB table, which could be read in a second or two, so
mount time is OK.

I have an idea for how to update the table relatively efficiently if you
are interested.
