Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VS3g2-0000i7-Gp
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2013 11:36:11 +0000
Received: by mail-lb0-f170.google.com with SMTP id w7so3157710lbi.15
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2013 04:35:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD6G_RTFsNJHEvev28FaV_BMDR=GfPREd=PwZJ_aGZc0k+19HA@mail.gmail.com>
References: <CAD6G_RTFsNJHEvev28FaV_BMDR=GfPREd=PwZJ_aGZc0k+19HA@mail.gmail.com>
Date: Fri, 4 Oct 2013 17:05:47 +0530
Message-ID: <CAD6G_RRMyb62ym3+cKqaxekS6ppXrAVMKnd_Tq4942Mt5=R3Eg@mail.gmail.com>
Subject: Re: [U-Boot]: Discussion on Serial Flash Discoverable Parameters
 (SFDP): JESD216A
From: Jagan Teki <jagannadh.teki@gmail.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Michal Simek <monstr@monstr.eu>, Seong-Ho An <SHAN@winbond.com>,
 "Langer Thomas \(LQDE RD ST PON SW\)" <thomas.langer@lantiq.com>,
 Willis Max <Max.Willis@spansion.com>, Simon Glass <sjg@chromium.org>,
 Tom Rini <trini@ti.com>, "Todd Legler \(tlegler\)" <tlegler@micron.com>,
 Conrado Canio <ccanio@winbond.com>, Syed Hussain <SHUssain@winbond.com>,
 Sourav Poddar <sourav.poddar@ti.com>,
 "MCHEN4@winbond.com" <MCHEN4@winbond.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added linux-mtd mailing list. and also few developer from winbond.

On Fri, Oct 4, 2013 at 12:21 AM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Hi All,
>
> As all we know that the spi_flash is a day-by-day developing hardware
> where each vendor has followed their own standard to get the best to
> come out.
>
> I see SFDP looks like a common standard where most of the vendors were
> following to get the flash parameter information at runtime.
>
> I have couple of questions, added few flash vendors on cc - request
> for all try to give some inputs
> 1. Does all vendors follow this standard at-least from the latest parts?
> 2. Any idea who are not following SFDP
> 3. Does the format of getting data from SFDP is varies from vendor to
> vendor or same?
> 4. Command to get the SFDP is same for all vendors?
> 5. What type of information we can get any list?
>
> Request for your comments, this will really help to shape the
> spi_flash code more dynamic.

-- 
Thanks,
Jagan.
--------
Jagannadha Sutradharudu Teki,
E: jagannadh.teki@gmail.com, P: +91-9676773388
Engineer - System Software hacker
U-boot - SPI Custodian and Zynq APSOC
Ln: http://www.linkedin.com/in/jaganteki
