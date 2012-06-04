Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SbcmX-0003tD-KH
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2012 19:17:38 +0000
Received: by laap9 with SMTP id p9so3940474laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2012 12:17:34 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 4 Jun 2012 21:17:34 +0200
Message-ID: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
Subject: Q: Cramfs Vs. Ubifs
From: Ran Shalit <ranshalit@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I read about cramfs and ubifs, but there is still something I don't
understand here, I hope you can help me with that...
1. It seems reasonable that execution from RAM is faster then Nand flash.
    So If I'm using ubifs, should I copy the executables to RAM before execute ?
2. If there is no need for writable filesystem, cramfs seems a good
choice, but some of the utilities write stuff to /var. How should we
handle that with cramfs ?
3. in terms of boot time, both cramfs and ubifs are equal. is it correct ?

Thank you,

Ran
