Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15GyR4-0006QP-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 08:47:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <86r8w0yqhz.fsf@bindaas.org> 
References: <86r8w0yqhz.fsf@bindaas.org> 
To: nikunj@bindaas.org (Nikunj A. Dadhania)
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com,
    vmalik@danielind.com, ndadhania@yahoo.com
Subject: Re: Permission problem on mtd block device 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Jul 2001 08:53:16 +0100
Message-ID: <23926.994060396@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

nikunj@bindaas.org said:
> mount /dev/mtdblock0 /mnt 
>
> this command works. it gives some directory listing such as..
>
> / # ls -al /mnt
> dr-xr-xr-x   1 0        0               0 Jan  1 00:03 .
> drwxr-xr-x  12 0        0            1024 Jul  2  2001 ..
> dr-xr-xr-x   1 0        0               0 Jan  1 00:03 001
> -r--r--r--   1 0        0               0 Jan  1 00:03 devices
> -r--r--r--   1 0        0               0 Jan  1 00:03 drivers

That looks like usbdevfs.

cat /proc/mounts /proc/filesystems

--
dwmw2
