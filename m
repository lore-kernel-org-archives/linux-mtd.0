Received: from mail-qc0-x22b.google.com ([2607:f8b0:400d:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcK68-0003fS-VQ
 for linux-mtd@lists.infradead.org; Mon, 21 Apr 2014 19:41:49 +0000
Received: by mail-qc0-f171.google.com with SMTP id c9so4490633qcz.30
 for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2014 12:41:26 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 21 Apr 2014 15:41:26 -0400
Message-ID: <CAMPHVD9=1icuuuXybU2qCyc6n9ZzF2igpr1HFjBU_RUHEaADPw@mail.gmail.com>
Subject: Estimating flash life by reading EC (Erase Counters)
From: David Yat Sin <jd.yatsin@gmail.com>
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
My goal is to be able to estimate the flash drive life in a production
environment, so if there is a better/easier way of achieving this,
please let me know.

I have a small embedded device using NAND than runs UBIFS for the user
partition. Our application constantly writes to log files, the log
files are appended and gzip'ed, so it is hard to determine how much
data is actually written to disk.

I am hoping to do this by:

1. Read the EC (Erase Count) headers for each page on the partition
2. Let my system run for several days/weeks/months
3. Read the EC headers again
4. Then extrapolate drive life expectancy by comparing number of erase
counts with the NAND endurance.

Is there a utility that I could use to read the Erase Counters on a
UBIFS partition?

Thank you
David
