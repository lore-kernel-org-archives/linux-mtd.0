From: tglx@linutronix.de (Thomas Gleixner)
Date: Wed, 12 Mar 2003 20:55:57 +0100
Subject: Problems building contents of snapshot 3-9-2003
In-Reply-To: <001101c2e8b0$d5c5e6c0$91c7580c@who5>
References: <001101c2e8b0$d5c5e6c0$91c7580c@who5>
Message-ID: <200303122055.57750.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wednesday 12 March 2003 17:02, Gregg C Levine wrote:
> Hello again from Gregg C Levine
> Um, no it does not. It breaks in two specific places. The filesystems
> for jff, and jff2. So, then what now? I'll keep trying. Indeed, when I
> bring up my Linux box, I'll even update the former snapshot to the
> current contents of CVS, today. However, this is beginning to feel old
> and annoying. When I started with this, I did think everything was
> fixed.

I just got a pristine 2.4.20 kernel and applied from current CVS
./patchin.sh -j /home/thomas/work/linux-2.4.20

Then I configured mtd, jffs, jffs2 and built the kernel. Works as exspected

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
