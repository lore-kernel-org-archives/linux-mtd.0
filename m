From: joern@wohnheim.fh-wedel.de (=?unknown-8bit?Q?J=F6rn?= Engel)
Date: Thu, 6 Mar 2003 17:55:24 +0100
Subject: Slow system after switching from 2.4.18 to 2.4.19
In-Reply-To: <20030306153515.GB2166@tkeitel001.bln.gelonet.local>
References: <20030306153515.GB2166@tkeitel001.bln.gelonet.local>
Message-ID: <20030306165524.GB13619@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 6 March 2003 16:35:15 +0100, Tino Keitel wrote:
> 
> after updating to 2.4.19, my system (Intel XScale based, 500 MHz, 16 MB
> flash, 32 MB RAM) was awfully slow. I suspect the reason is a slow
> access to the filesystem. As soon as something happens on the
> filesystem, e.g. in shell scripts, runtimes are multimple times higher
> than with 2.4.18. A short example what happens with the 2.4.19 kernel:
> 
> (1)
> for i in 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
> 	do echo "nothing" > /dev/null ;
> done
> 
> takes 2 seconds(!), just for 30 echos.
> 
> (2)
> for i in 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
> 	do true;
> done
> 
> returns immediately because 'true' is a shell builtin and no filesystem
> access is necessary. With the 2.4.18 kernel, (1) also doesn't take
> sensible time to complete. Of course, the configuration is the same
> with both kernels. Any hints?

Only that mtd is likely not the cause. :)

Maybe someone on lkml known more...

J?rn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
