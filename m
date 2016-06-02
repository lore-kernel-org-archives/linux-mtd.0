Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8XnO-0000TV-DG
 for linux-mtd@lists.infradead.org; Thu, 02 Jun 2016 18:56:43 +0000
Received: by mail-yw0-x235.google.com with SMTP id x189so59008607ywe.3
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jun 2016 11:56:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160601223713.7a068a99@bbrezillon>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <1461961285-24159-2-git-send-email-kdasu.kdev@gmail.com>
 <20160530105005.62faa711@bbrezillon>
 <CAKekbevuxMUsuKRuJE0cqNK_zAgG=64YOE6-OEYgY-neY7Ds1w@mail.gmail.com>
 <20160601223713.7a068a99@bbrezillon>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 2 Jun 2016 14:55:41 -0400
Message-ID: <CAKekbeukFNkZ_Jk55jQvEWVrT4Y2zhQrNEQ=GRTPmhhA4dOnZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: brcmnand: Detect sticky ucorr ecc error on dma
 reads
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes have tried this, but its the controller internals that causes this
condition.

Kamal
