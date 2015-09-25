Received: from mail1-a.eqx.gridhost.co.uk ([95.142.156.16])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfPLU-0006TL-KI
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 09:31:13 +0000
Received: from [209.85.212.169] (helo=mail-wi0-f169.google.com)
 by mail1.eqx.gridhost.co.uk with esmtpsa (UNKNOWN:AES128-GCM-SHA256:128)
 (Exim 4.72) (envelope-from <cybergibbons@cybergibbons.com>)
 id 1ZfPJQ-0003m2-KR
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 10:29:04 +0100
Received: by wiclk2 with SMTP id lk2so11613270wic.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2015 02:29:04 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 25 Sep 2015 10:29:04 +0100
Message-ID: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
Subject: UBIFS recovery/forensics tools
From: Andrew Tierney <cybergibbons@cybergibbons.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am a reverse engineer, and I am finding that UBIFS is becoming
increasingly common on embedded devices. A common task is recovering
file systems from locked down or damaged devices, and I'm finding this
very challenging with UBIFS!

I have seen talk on here of userspace tools to recover damaged UBIFS
systems. Did anything every come of this? I am currently using "ubi
reader" ( https://github.com/jrspruitt/ubi_reader ) with some success.

Andrew
