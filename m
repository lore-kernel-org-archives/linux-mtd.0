From: tglx@linutronix.de (Thomas Gleixner)
Date: Tue, 11 Mar 2003 09:15:48 +0100
Subject: 2.4.19 rmk4 Jffs2 Performance problems, Upgrade diffulculty.
In-Reply-To: <3E6D1821.3060002@visi.com>
References: <3E6D1821.3060002@visi.com>
Message-ID: <200303110915.48377.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Monday 10 March 2003 23:56, RobertS wrote:
> Hello,
>     I am running an almost pristine copy of 2.4.19 rmk4.
>     I have applied the patch, linux-2.4.19-pre10-shared-zlib.
>     I have updated to mtd-snapshot-20030305.tar.
Could you please try the following:
1. Get your almost pristine copy of 2.4.19.rmk4
2. use latest MTD snapshot and use patchin.sh from patches directory. This 
will apply zlib patch too
3. Report results

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
