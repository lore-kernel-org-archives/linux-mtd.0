Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghqQ3-0005gS-Rn
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2019 06:35:53 +0000
Received: by mail-lj1-x233.google.com with SMTP id g11-v6so11954624ljk.3
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jan 2019 22:35:50 -0800 (PST)
MIME-Version: 1.0
From: Shibin George <george.shibin1993@gmail.com>
Date: Fri, 11 Jan 2019 12:05:37 +0530
Message-ID: <CAGu8XfRpjW9hv918BOoh6jEA1rZ9v-Dngra7cjMi3KegyXOvSQ@mail.gmail.com>
Subject: gluebi vs. ubi-volume mapping
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using the gluebi driver to emulate mtd block devices on top of
which I use squashfs.
I understand that calling ubiattach will result in a gluebi device
getting created for each  volume on that ubi device. But is there any
way to figure out which gluebi device was created for which particular
ubi volume?
/proc/mtd does show the mtd device with the name of the ubi volume but
I have multiple volumes across different ubi devices with the same
volume_name hence the dilemma.

Is there already a way to figure out, for a given "ubi-device+volume",
which gluebi device was created? Thanks in advance..

Regards,
Shibin George
george.shibin1993@gmail.com
