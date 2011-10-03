Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RAo5u-00066k-2J
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2011 19:22:31 +0000
Received: by wyi11 with SMTP id 11so4527471wyi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Oct 2011 12:22:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201110031135.19340.ffainelli@freebox.fr>
References: <CD1B567EF015FE41B29FF476B8600DDD26BBF25958@vsrv-mail01.newtechgroup.local>
	<201110031135.19340.ffainelli@freebox.fr>
Date: Mon, 3 Oct 2011 12:22:26 -0700
Message-ID: <CAN8TOE-UVAcN5MOhbrW-iayuAfPV1OyKrVYogVE7gQh3Hyvrhw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: restore useage of ONFI reported bus width
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, "Hitz, Christian" <christian.hitz@aizo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 3, 2011 at 2:35 AM, Florian Fainelli <ffainelli@freebox.fr> wro=
te:
> On Monday 03 October 2011 08:57:59 Hitz, Christian wrote:
>> This patch changes the nand_flash_detect_onfi() function to pass
>> the NAND bus width it discovered via ONFI back to the caller.
>>
>> Signed-off-by: Christian Hitz <christian.hitz@aizo.com>
>
> Acked-by: Florian Fainelli <ffainelli@freebox.fr>
>
>> ---
>> =A0drivers/mtd/nand/nand_base.c | =A0 =A08 ++++----
>> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> I though Brian had already submitted a fix for this.

No, it was Matthieu CASTET (I Acked). It's already queued for the next
release; you can find it in l2-mtd-2.6.git:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

Thanks for the submission though!

Brian
