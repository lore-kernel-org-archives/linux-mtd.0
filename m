Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15GzbM-0006Vc-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 10:02:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <8666dbww71.fsf@bindaas.org> 
References: <8666dbww71.fsf@bindaas.org>  <86r8w0yqhz.fsf@bindaas.org> <23926.994060396@redhat.com> 
To: nikunj@bindaas.org (Nikunj A. Dadhania)
Cc: jffs-dev@axis.com, linux-mtd@lists.infradead.org
Subject: Re: Permission problem on mtd block device 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Mon, 02 Jul 2001 10:08:15 +0100
Message-ID: <32365.994064895@redhat.com>
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
> Is the major and minor number are correct which I have specified in
> previous mail? (for the reference mtd0 90 0, mtdr 90 1, mtdblock0 31
> 0)

Yep, they're fine.


>  mount -t jffs /dev/mtdblock0 /mnt/ 
> mount: Mounting /dev/mtdblock0 on /mnt failed: Permission denied 

I don't think that error is coming from JFFS. Can you build it with 
debugging enabled and show the output of 'dmesg'? It'll show us whether 
it's even getting as far as jffs_read_super().



--
dwmw2
