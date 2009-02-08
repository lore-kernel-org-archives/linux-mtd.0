Received: from mail-gx0-f20.google.com ([209.85.217.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LW6x4-00081j-Kk
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 10:32:05 +0000
Received: by gxk13 with SMTP id 13so1380750gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Feb 2009 02:31:49 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <71cd59b00902080148l5304b4eie4dd3868ec12337e@mail.gmail.com>
References: <7824366.270131233573513030.JavaMail.weblogic@epml10>
	<49896448.20407@nokia.com>
	<6b5362aa0902050140q3c6cbe85ye03d9b5ee59c7f48@mail.gmail.com>
	<71cd59b00902080148l5304b4eie4dd3868ec12337e@mail.gmail.com>
Date: Sun, 8 Feb 2009 19:31:49 +0900
Message-ID: <9c9fda240902080231r51c4bcf3o37c0044bf9d924ee@mail.gmail.com>
Subject: Re: Regarding UBI scalability
From: Kyungmin Park <kmpark@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: AMIT KUMARSHARMA <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	Brijesh Singh <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, Feb 8, 2009 at 6:48 PM, Corentin Chary <corentin.chary@gmail.com> wrote:
> On Thu, Feb 5, 2009 at 10:40 AM, Brijesh Singh <brij.singh@samsung.com> wrote:
>> On Wed, Feb 4, 2009 at 3:17 PM, Adrian Hunter
>> <ext-adrian.hunter@nokia.com> wrote:
>>> ext BRIJESH SINGH wrote:
>>>> Hi,
>>>>
>>>> Artem Bityutskiy wrote:
>>>>> On Mon, 2009-02-02 at 13:07 +0200, Adrian Hunter wrote:
>>>>>> I would suggest an intermediate step.  Create UBI2 which is
>>>>>> similar to UBI but stores eraseblock information in one place,
>>>>>> instead of at the beginning of each eraseblock.  Such an approach
>>>>>> might be OK up to as much as 64GiB, and would probably perform
>>>>>> better than a fully scalable version.
>>>>>>
>>>>>> Then look at creating UBI3, which is fully scalable.
>>>>> Yes, I assume UBI2 should store mapping/erasure information in separate
>>>>> tables, not in each eraseblock. So we should get rid of eraseblock
>>>>> headers.
>>>>
>>>> Yes that is what I meant.  You could probably make do with as little as
>>>> 12 bytes per eraseblock so a 64GiB flash with 512KiB eraseblock size
>>>> would need 1536KiB table, which could be read in a second or two, so
>>>> mount time is OK.
>>>>
>>>> I have an idea for how to update the table relatively efficiently if you
>>>> are interested.
>>>>
>>>> I am definitely interested. But apart from on flash headers, I am also interested in memory consumption scaling.
>>>> UBIFS solved this problem quite interestingly. Can something similar be borrowed for UBI?
>>>>
>>>> Thanks and Regards,
>>>> Brijesh
>>>
>>> I would leave the memory consumption issue for UBI3.
>
> As you are working on UBI2, have you a git tree or something ? I may
> have some time to help :)
> Thanks
>

One more requested feature.
How about to scan ubi image and bad block table at simultaneously?
Now there's two full device scan, bbt and ubi at booting time.
As internal LEA mapping layout, how about to add bbt layout?

It's also helpful to MLC since MLC doesn't have read oob so it calls
page read command to build bbt.
As you know it takes long time.

I'm not sure if internal LEA maping is supported, it's meaningful work or not.

How do you think?

Thank you,
Kyungmin Park
