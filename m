Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xx8zY-0000CR-B7
 for linux-mtd@lists.infradead.org; Sat, 06 Dec 2014 06:37:20 +0000
Received: by mail-ig0-f169.google.com with SMTP id hl2so1886769igb.2
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 22:36:58 -0800 (PST)
Received: from [172.16.10.16] (66-162-60-14.static.twtelecom.net.
 [66.162.60.14])
 by mx.google.com with ESMTPSA id uf2sm404183igc.11.2014.12.05.22.36.56
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Dec 2014 22:36:57 -0800 (PST)
Message-ID: <5482A407.4070002@gmail.com>
Date: Sat, 06 Dec 2014 01:36:55 -0500
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: What does oob stand for in mtd.h?
References: <54827EEB.7030305@gmail.com>
In-Reply-To: <54827EEB.7030305@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/05/2014 10:58 PM, nick wrote:
> Greetings MTD subsystem developers,
> I am wondering what oob stands for in mtd.h as a lot of functions are using it in their names. This would greatly need in me understanding the core of this subsystem if something points out what this stands for.
>
"Google is your friend". :)

A search for "NAND oob" turns up multiple URLs that can shed light on
the meaning of OOB in the context of a NAND device.

But to suffice, OOB = "Out Of Band" meaning the bytes of "extra" sotrage
read/written with every page access of a NAND device (aka the "spare
area" of each page).  Usually the OOB area contains ECC bytes (to
correct the NAND in the case of a bit flip during read), and probably
metadata (used by YAFFS and other NAND-based filesystems).

-- 
Peter Barada
peter.barada@gmail.com
