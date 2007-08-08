Received: from nz-out-0506.google.com ([64.233.162.226])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIpfz-00026I-3L
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 13:50:36 -0400
Received: by nz-out-0506.google.com with SMTP id z3so101242nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Aug 2007 10:50:30 -0700 (PDT)
Message-ID: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
Date: Wed, 8 Aug 2007 13:50:29 -0400
From: "James Olin Oden" <james.oden@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: What is the correct way to make an mtdchar device available?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a system with the ST Micro M50FW080 firmware hub.  I have
checked the source code and the jedec_probe module has detection code
for that driver.  So I've done:

   modprobe jedec_probe
   modprobe mtdchar

Both modules load with no output going to the console.   No /dev/mtd#
device appears (there are two firmware hubs so I would assume mtd0 and
mtd1 would apprear).  If I do a mknod, the device is there but I
cannot read from it.

I have now tried this with both the Fedora Core 6 kernel and the RHEL
5 kernel (all of which have mtd configured, and are using 2.6.18
kernel (with RedHats legion of patches).

What am I missing?  What is the correct way to bring up an mtdchar device?

Thanks...james
