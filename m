Received: from rn-out-0910.google.com ([64.233.170.190])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSOSN-0000Sl-0h
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2009 04:24:50 +0000
Received: by rn-out-0910.google.com with SMTP id j43so2901402rne.3
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Jan 2009 20:24:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4980165A.3070805@nokia.com>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1232961503.22350.89.camel@localhost.localdomain>
	<9c9fda240901271820x23993c55hba3fa5078ea6426@mail.gmail.com>
	<4980165A.3070805@nokia.com>
Date: Thu, 29 Jan 2009 13:24:45 +0900
Message-ID: <9c9fda240901282024k24b7558dr2d4d5e747d5a8537@mail.gmail.com>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Kyungmin Park <kyungmin78@gmail.com>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Bergeron <mho.linux-mtd@b2n.ca>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: kyungmin78@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 28, 2009 at 5:24 PM, Adrian Hunter
<ext-adrian.hunter@nokia.com> wrote:
> Kyungmin Park wrote:
>> Hi,
>>
>> On Mon, Jan 26, 2009 at 6:18 PM, Artem Bityutskiy
>> <dedekind@infradead.org> wrote:
>>> On Wed, 2009-01-07 at 23:13 -0500, David Bergeron wrote:
>>>> Hello all,
>>>>
>>>> I'm getting some sort of volume corruption problem with UBIFS after
>>>> doing
>>>> rootfs updates using rsync.
>>>>
>>>> I've cooked up a minimalist test trying to eliminate possible
>>>> interference.
>>>> The following steps will trigger the corruption almost every time.
>>>> No
>>>> errors
>>>> or warnings are produced during this procedure, every step behaves
>>>> as
>>>> expected:
>>> David,
>>>
>>> we think we've fixed this bug. The reason was that when mounting RO,
>>> then re-mounting read-write, the orphan sub-system was not properly
>>> initialized. The fix is available at the ubifs-v2.6.28.git tree. I've
>>> back-ported all stable changes and fixes to the tree. You need this fix:
>>>
>>> commit b3718eedf4ab91307f64a79ad8eb911ca401bd22
>>> Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
>>> Date:   Mon Jan 26 10:55:40 2009 +0200
>>>
>>>    UBIFS: ensure orphan area head is initialized
>>>
>>>    When mounting read-only the orphan area head is
>>>    not initialized.  It must be initialized when
>>>    remounting read/write, but it was not.  This patch
>>>    fixes that.
>>>
>>>    [Artem: sorry, added comment tweaking noise]
>>>    Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
>>>    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>>>
>>> However, I recommend you to incorporate all UBI/UBIFS changes since
>>> 2.6.28, because there were other bug-fixes.
>>>
>>> You may find information about back-port trees here:
>>> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source
>>>
>>> Please, send us some feed-back about whether your problem has been
>>> solved.
>>>
>>
>> I got the similar problem with orphan node handling. with this patch,
>> it's solved. but there are strange ones.
>>
>> I boot with ubifs with ro mode. and then I remount it as rw. after
>> some work, I remount it as ro. at that case.
>> It displayed "Device busy" so I can't change the mode. Did you have any clue?
>
> Speaking of orphans, it is not possible to remount rw->ro with files that are
> pending for deletion on any file system e.g. open file, unlink it, try to
> remount ro => device busy error.  The unlinked file must be closed first so
> that the file system can delete it.
>

It seems that. the normal operation is okay. but some complicated
operation doesn't.
I try to do and give more descriptions.

Thank you,
Kyungmin Park
