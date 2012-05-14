Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STqJ1-00046X-CV
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 08:07:00 +0000
Received: by ggcs5 with SMTP id s5so3360158ggc.36
 for <linux-mtd@lists.infradead.org>; Mon, 14 May 2012 01:06:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1336933106.1643.0.camel@koala>
References: <1336731341-615-1-git-send-email-javier.martin@vista-silicon.com>
 <1336933106.1643.0.camel@koala>
Date: Mon, 14 May 2012 10:06:57 +0200
Message-ID: <CACKLOr04VHS_BnrrGfJeBfaDKyMfQyPf9v0ikFwsimdGwmrLHA@mail.gmail.com>
Subject: Re: MTD: Add fixup for S29NS512P NOR flash.
From: javier Martin <javier.martin@vista-silicon.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Gernot.Hoyler@spansion.com, Artem.Bityutskiy@nokia.com,
 joakim.tjernlund@transmode.se, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, tabe@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 May 2012 20:18, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-05-11 at 12:15 +0200, Javier Martin wrote:
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* =A0S29NS512P flash uses more than 8bits to report number =
of sectors,
>> + =A0 =A0 =A0* which is not permitted by CFI.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 cfi->cfiq->EraseRegionInfo[0] =3D 0x020001ff;
>> + =A0 =A0 pr_warning("%s: Bad S29NS512P CFI data, adjust to 512 sectors\=
n", mtd->name);
>
> I've removed the warning and pushed to l2-mtd.git, thanks! If you
> disagree - please complain.

Great, I totally agree.

Thanks.

--=20
Javier Martin
Vista Silicon S.L.
CDTUC - FASE C - Oficina S-345
Avda de los Castros s/n
39005- Santander. Cantabria. Spain
+34 942 25 32 60
www.vista-silicon.com
