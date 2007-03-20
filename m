Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTdV5-0006Fj-UZ
	for linux-mtd@lists.infradead.org; Tue, 20 Mar 2007 08:31:40 -0400
Received: by nf-out-0910.google.com with SMTP id a4so318378nfc
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Mar 2007 05:31:28 -0700 (PDT)
Message-ID: <625fc13d0703200531i359508a9jbe1a32524da5d6d1@mail.gmail.com>
Date: Tue, 20 Mar 2007 07:31:27 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Michel Marti" <mma@objectxp.com>
Subject: Re: JFFS2: Filesystem corruption after umount/mount
In-Reply-To: <etoj9s$b84$1@sea.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <etoj9s$b84$1@sea.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/20/07, Michel Marti <mma@objectxp.com> wrote:
> I also read back the mtd device after erasing it and it contains 0xFF bytes only.
> Additionally, I copied a jffs2 image to the device, read it back and compared it to the
> image and there was no difference.

Do you have any output from the kernel after doing the
mount/unmount/ls operations?  dmesg after those would perhaps be more
interesting.

josh
