Received: from secvs02.rockwellcollins.com ([205.175.225.241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4qXW-0000TE-No
 for linux-mtd@lists.infradead.org; Sat, 07 Apr 2018 16:18:08 +0000
Received: by mail-oi0-f72.google.com with SMTP id k13-v6so2428339oib.4
 for <linux-mtd@lists.infradead.org>; Sat, 07 Apr 2018 09:17:50 -0700 (PDT)
MIME-Version: 1.0
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Sat, 7 Apr 2018 11:17:49 -0500
Message-ID: <CADFuHZ71CjMPTB_GmQA6c2YRdJvYSW=ep6vPQzwXgMZxtSbR6Q@mail.gmail.com>
Subject: ubihealthd : Question regarding the frequency of reading and scrubbing
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
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

I am using ubihealthd (https://lwn.net/Articles/663751/) to trigger
re-reads and scrubbing on NAND partitions.

My question is regarding the frequency of triggering reads and scrubs,
how can I trigger them efficiently so that it does not overkill for my
NAND partitions, CPU and still serve it purpose of data retention?

Mount type of the partition (read only/read write)  matter on the
frequency at which I should schedule read and scrub? As per the
default parameters, read interval is 10 times more frequent than
scrub? Also, the read threshold varies based on the use-case or the
default value is acceptable for all use-cases ?

-- 
Ronak A Desai
Sr. Software Engineer
Airborne Information Solutions / RC Linux Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
Ronak.Desai@rockwellcollins.com
https://www.rockwellcollins.com/
