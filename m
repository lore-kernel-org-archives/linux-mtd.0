Received: from nm16-vm3.access.bullet.mail.bf1.yahoo.com ([216.109.115.50])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b65pc-0004Hd-BM
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 00:40:53 +0000
From: "PJ" <paul.j2@rogers.com>
To: <linux-mtd@lists.infradead.org>
Subject: Looking for an alternative to ubimirror
Date: Thu, 26 May 2016 20:40:29 -0400
Message-ID: <046201d1b7b0$5f15b400$1d411c00$@rogers.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Can anyone please recommend a procedure to copy one UBI volume to another? 

I'd like to execute from the bash command line, if possible.

One upon a time I was able to use ubimirror, however that command appears to
have been removed from mtd-utils. 

- The source volume will be mounted R/O as it is the rootfs. 
- The destination volume will be unrestricted (unmounted).
- Both the source and destination volumes are in the same device.

I checked the FAQ, the archive, and Google but I came up empty, so thanks.

Paul
