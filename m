Received: from mu-out-0910.google.com ([209.85.134.185])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LW6H7-0000Xx-8f
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 09:48:44 +0000
Received: by mu-out-0910.google.com with SMTP id w9so984116mue.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Feb 2009 01:48:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <6b5362aa0902050140q3c6cbe85ye03d9b5ee59c7f48@mail.gmail.com>
References: <7824366.270131233573513030.JavaMail.weblogic@epml10>
	<49896448.20407@nokia.com>
	<6b5362aa0902050140q3c6cbe85ye03d9b5ee59c7f48@mail.gmail.com>
Date: Sun, 8 Feb 2009 10:48:27 +0100
Message-ID: <71cd59b00902080148l5304b4eie4dd3868ec12337e@mail.gmail.com>
Subject: Re: Regarding UBI scalability
From: Corentin Chary <corentin.chary@gmail.com>
To: Brijesh Singh <brij.singh@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: AMIT KUMARSHARMA <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 5, 2009 at 10:40 AM, Brijesh Singh <brij.singh@samsung.com> wrote:
> On Wed, Feb 4, 2009 at 3:17 PM, Adrian Hunter
> <ext-adrian.hunter@nokia.com> wrote:
>> ext BRIJESH SINGH wrote:
>>> Hi,
>>>
>>> Artem Bityutskiy wrote:
>>>> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
>>>>> I would suggest an intermediate step.  Create UBI2 which is
>>>>> similar to UBI but stores eraseblock information in one place,
>>>>> instead of at the beginning of each eraseblock.  Such an approach
>>>>> might be OK up to as much as 64GiB, and would probably perform
>>>>> better than a fully scalable version.
>>>>>
>>>>> Then look at creating UBI3, which is fully scalable.
>>>> Yes, I assume UBI2 should store mapping/erasure information in separate
>>>> tables, not in each eraseblock. So we should get rid of eraseblock
>>>> headers.
>>>
>>> Yes that is what I meant.  You could probably make do with as little as
>>> 12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
>>> would need 1536KiB table, which could be read in a second or two, so
>>> mount time is OK.
>>>
>>> I have an idea for how to update the table relatively efficiently if you
>>> are interested.
>>>
>>> I am definitely interested. But apart from on flash headers, I am also interested in memory consumption scaling.
>>> UBIFS solved this problem quite interestingly. Can something similar be borrowed for UBI?
>>>
>>> Thanks and Regards,
>>> Brijesh
>>
>> I would leave the memory consumption issue for UBI3.

As you are working on UBI2, have you a git tree or something ? I may
have some time to help :)
Thanks

-- 
Corentin Chary
http://xf.iksaif.net
