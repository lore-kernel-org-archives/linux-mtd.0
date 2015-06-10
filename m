Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2cw5-0006Ql-J5
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 10:08:41 +0000
Received: by qgfa66 with SMTP id a66so14321496qgf.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 03:08:19 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 10 Jun 2015 20:08:19 +1000
Message-ID: <CAC7eWMUvdiNFiiGqSkmv1qwFDUa52VZCCQds_BdnqocoskN+Qg@mail.gmail.com>
Subject: Trouble with UBIFS
From: Smitha Rathnam <rathnam.smitha@gmail.com>
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

 Hi,

 We have an embedded linux (2.6) system. Since the past few months, we
have been seeing a corruption of the log filesystem.
 The filesystem is using mtd5 device.
 The error looks like this;
 user.notice kernel: klogd started: BusyBox v1.20.0 (2012-09-18 17:42:52 MST)

 Jan  1 00:00:05 user.debug kernel: 00001fa0: 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000
................................
 Jan  1 00:00:05 user.debug kernel: 00001fc0: 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000
................................
 Jan  1 00:00:05 user.debug kernel: 00001fe0: 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000
................................
 *Jan  1 00:00:05 user.err kernel: UBIFS error (pid 1110):
ubifs_recover_leb: LEB 24 scanning failed*

 Is there a way to retrieve data from the partition? How do we fix this error?

 Please help.

 Thanks and regards,
 Smitha.
