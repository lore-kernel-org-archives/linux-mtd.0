Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elr93-00080a-Tp
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 07:06:23 +0000
Received: by mail-qt0-x235.google.com with SMTP id d26so5007854qtj.4
 for <linux-mtd@lists.infradead.org>; Tue, 13 Feb 2018 23:06:11 -0800 (PST)
MIME-Version: 1.0
From: Ran Shalit <ranshalit@gmail.com>
Date: Wed, 14 Feb 2018 09:06:09 +0200
Message-ID: <CAJ2oMhK_oH9RfekXiuTw25rghdXWjH4Ju_WCiC6ey5hccvHx1g@mail.gmail.com>
Subject: Writing log in flash
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a general question about NAND technology:

Is it possible to write in nand continuously ?

I understand that NAND technology requires block erase, and then the
writing is done per page.
Yet, jffs for example achieve doing fwrite() which can get any size,
so how does jffs achieve that ?
Is it that it write pages continously ? We actually use on-die ecc, so
I am not sure if that is possible. I mean, if we write first 10 words
in page, so on writing the rest of the pagem, the ecc will need to be
re-written, so that's probably a problem.

Does it mean we have to wait for a complete page bytes, before writing
into flash ?

Thank you,
Ran
