Received: from na3sys009aog113.obsmtp.com ([74.125.149.209])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRnLg-0005sE-07
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 15:28:44 +0000
Received: by mail-vx0-f174.google.com with SMTP id 39so4155939vxi.19
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 08:28:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1306941256.4405.123.camel@localhost>
References: <1306923407.4405.94.camel@localhost>
	<1306940008-28454-1-git-send-email-bengardiner@nanometrics.ca>
	<1306941256.4405.123.camel@localhost>
Date: Wed, 1 Jun 2011 11:28:41 -0400
Message-ID: <BANLkTimzuZ5URhDj2BxPj3g_YaHmZufWsg@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: fixup merged 'UBIFS: fix-up free space earlier'
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, Jun 1, 2011 at 11:14 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2011-06-01 at 10:53 -0400, Ben Gardiner wrote:
>> When the patch 'UBIFS: intialize LPT earlier' was massaged before being applied
>> the context of the next patch 'UBIFS: fix-up free space earlier' was muddled
>> sufficiently for the order of allocate-lpt then free-space-fixup was reversed --
>> I think.
>>
>> Put the free-space-fixup after allocate-lpt.
>>
>> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>>
>> ---
>> With this fixup applied on-top-of the ubifs-2.6 master I am able to mount a
>> ubinized image containing a UBIFS volume which has the free-space-fixup flag
>> set. No assertions are displayed.
>
> Thanks. Merged this patch to the 3rd one and pushed out.

You're most welcome.

Both branches master and linux-next are working as expected.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
