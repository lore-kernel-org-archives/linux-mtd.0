From: tino.keitel@innominate.com (Tino Keitel)
Date: Thu, 6 Mar 2003 16:35:15 +0100
Subject: Slow system after switching from 2.4.18 to 2.4.19
Message-ID: <20030306153515.GB2166@tkeitel001.bln.gelonet.local>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi folks,

after updating to 2.4.19, my system (Intel XScale based, 500 MHz, 16 MB
flash, 32 MB RAM) was awfully slow. I suspect the reason is a slow
access to the filesystem. As soon as something happens on the
filesystem, e.g. in shell scripts, runtimes are multimple times higher
than with 2.4.18. A short example what happens with the 2.4.19 kernel:

(1)
for i in 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	do echo "nothing" > /dev/null ;
done

takes 2 seconds(!), just for 30 echos.

(2)
for i in 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
	do true;
done

returns immediately because 'true' is a shell builtin and no filesystem
access is necessary. With the 2.4.18 kernel, (1) also doesn't take
sensible time to complete. Of course, the configuration is the same
with both kernels. Any hints?

Thanks in advance.
Tino

-- 
tino.keitel at innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
