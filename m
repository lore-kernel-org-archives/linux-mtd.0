Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJQRK-0000Xc-Am
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 14:28:31 +0000
Received: from 212-183-101-122.adsl.highway.telekom.at ([212.183.101.122]
 helo=[192.168.0.2])
 by Galois.linutronix.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.72) (envelope-from <rw@linutronix.de>) id 1SJQRG-0001YI-5u
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 16:28:26 +0200
Message-ID: <4F8ADB04.3090901@linutronix.de>
Date: Sun, 15 Apr 2012 16:28:20 +0200
From: Richard Weinberger <rw@linutronix.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: mtdchar kernel oops
References: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
In-Reply-To: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 15.04.2012 13:58, schrieb Joel Reardon:
> I think that this patch:
> "mtdchar: kill persistently held vfsmount"
> http://permalink.gmane.org/gmane.linux.kernel.commits.head/314175
> 
> has started causing kernel oops's when running ubiformat. The oops is
> occuring in fs/namespace.c's mnt_add_count() line:
>         this_cpu_add(mnt->mnt_pcp->mnt_count, n);
> 
> with the stack trace:
> mntget()
> simple_pin_fs()
> mtdchar_open()
> 

Can you please submit the stack trace verbatim?

Thanks,
//richard


-- 
Phone: +49 7556 91 98 91; Fax.: +49 7556 91 98 86

Firmensitz: 88690 Uhldingen, Auf dem Berg 3
Registergericht: Amtsgericht Freiburg i. Br., HRB 700 806;
StNr. 87007/07777; Ust-Id Nr.: DE252739476
Geschäftsführer: Heinz Egger, Thomas Gleixner
