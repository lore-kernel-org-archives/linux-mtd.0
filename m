Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YR7tl-0001TO-OA
 for linux-mtd@lists.infradead.org; Thu, 26 Feb 2015 23:31:18 +0000
Received: by mail-ob0-f177.google.com with SMTP id wp18so14467631obc.8
 for <linux-mtd@lists.infradead.org>; Thu, 26 Feb 2015 15:30:56 -0800 (PST)
MIME-Version: 1.0
From: Nam Nguyen <namnguyen@google.com>
Date: Thu, 26 Feb 2015 15:30:36 -0800
Message-ID: <CA+YNSmVuL+xRd5X0NWj_VCgPBDq9=7mZcqhRaNR1PmRrYL3szg@mail.gmail.com>
Subject: Unbounded update to a UBI volume
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

Hello list,

The argument to IOCVOLUP is the size of the update.  In case of an
update from a stream, such as from a BZip'ed source, this size is
often not known ahead of time.  Is there a way to programmatically
clear the update marker, without having to pad the volume up to its
size, hence saving unnecessary writes?

Thanks,
Nam
