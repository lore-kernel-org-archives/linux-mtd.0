From: dwmw2@infradead.org (David Woodhouse)
Date: 14 Feb 2003 13:36:05 +0000
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302141427.31025.tglx@linutronix.de>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141402.53443.tglx@linutronix.de>
 <1045228464.22719.54.camel@passion.cambridge.redhat.com>
 <200302141427.31025.tglx@linutronix.de>
Message-ID: <1045229764.22719.56.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-14 at 13:27, Thomas Gleixner wrote:
> True, but pread/pwrite does not support two pointers.
> 
> We can use one pointer, but then you have to copy things around in userspace.

_ANYTHING_ is better than an ioctl which takes pointers to userspace
buffers. 

-- 
dwmw2
