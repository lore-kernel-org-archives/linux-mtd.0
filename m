Received: from mail-qa0-x22b.google.com ([2607:f8b0:400d:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwjdJ-0000Pu-R4
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 03:32:42 +0000
Received: by mail-qa0-f43.google.com with SMTP id bm13so12727131qab.2
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 19:32:20 -0800 (PST)
Received: from [10.214.80.26] (gate-tx3.freescale.com. [192.88.168.1])
 by mx.google.com with ESMTPSA id f105sm28580950qge.1.2014.12.04.19.32.19
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Dec 2014 19:32:19 -0800 (PST)
Message-ID: <54812742.8050407@gmail.com>
Date: Thu, 04 Dec 2014 21:32:18 -0600
From: gmail <xhnjupt@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD Read OOB Question
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a question about how mtd read OOB. Does MTD assume the OOB is not
covered by ECC? I think if raw read the OOB data, it hardly to guarantee
the data consistency. I met this issue when system scans BBT, the BBT list
changes in each time.

Is that a general problem? Any comments for it? Thanks.

Han Xu
