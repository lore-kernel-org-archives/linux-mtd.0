From: dwmw2@infradead.org (David Woodhouse)
Date: 14 Feb 2003 13:14:25 +0000
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302141402.53443.tglx@linutronix.de>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141200.50767.tglx@linutronix.de>
 <200302141136.29775.phil@river-bank.demon.co.uk>
 <200302141402.53443.tglx@linutronix.de>
Message-ID: <1045228464.22719.54.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-14 at 13:02, Thomas Gleixner wrote:
> But then we should add two pointers, so you can hold two different buffers 
> from userspace.

Ug. This rapidly becomes vile. How about adding a new device for the OOB
data, using pread/pwrite on that.

-- 
dwmw2
