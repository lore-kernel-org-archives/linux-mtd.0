From: Russ.Dill@asu.edu (Russ Dill)
Date: 12 Mar 2003 01:04:09 -0700
Subject: Problems building contents of snapshot 3-9-2003
In-Reply-To: <001b01c2e869$37224c80$bda6580c@who5>
References: <001b01c2e869$37224c80$bda6580c@who5>
Message-ID: <1047456248.7310.4.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-03-12 at 00:30, Gregg C Levine wrote:
> Hello from Gregg C Levine
> Well, I am now closer to my working problem's solution. But now a newproblem, or problems has surfaced. And here's a C&P of the problems:
> Script started on Tue Mar 11 23:06:53 2003

before you go through all this trouble, what is in CVS that you need
that isn't in 2.4.20 stock?

> Script done on Tue Mar 11 23:07:14 2003
> 
> Script started on Tue Mar 11 23:09:35 2003
> root at drwho4:/usr/src/mtd/util# make
> 
> gcc -I../include -O2 -Wall -Wstrict-prototypes -Wshadow   -c -o
> crc32.o crc32.c
> 
> In file included from crc32.c:42:
> 
> crc32.h:8: parse error before `crc32_table'
> 

I only use the stock kernel stuff and tools from the debian packages, so
I don't know what the problem would be here, but since you are traking
CVS, you can expect some problems, you just need to solve them.
