From: ahaas@airmail.net (Art Haas)
Date: Mon, 3 Mar 2003 15:33:17 -0600
Subject: [PATCH] C99 initializers for drivers/mtd files
In-Reply-To: <1046726489.2672.641.camel@tubarao>
References: <20030226205334.GB8966@debian> <20030227194424.GC29233@wohnheim.fh-wedel.de> <20030227214646.GD8116@debian> <20030302185616.GC10681@wohnheim.fh-wedel.de> <1046724566.2672.634.camel@tubarao> <20030303210613.GA7875@wohnheim.fh-wedel.de> <1046726489.2672.641.camel@tubarao>
Message-ID: <20030303213317.GB6239@debian>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, Mar 03, 2003 at 02:21:29PM -0700, Thayne Harbaugh wrote:
> Hmmm.  I guess C99 mostly works - with the exception of array
> initializers:
> 
> [thayne at tubarao tmp]$ cat foo.c
>                                                                                 
> struct foo {
>   int bar;
>   int baz;
> };
>                                                                                 
> struct foo fufu[] = {
>   [0].bar = 0,
>   [0].baz = 0
> };
>                                                                                 
> [thayne at tubarao tmp]$ gcc -c foo.c
> foo.c:8: unknown field `bar' specified in initializer
> 
> It's the array initialization that I want to use.  Grrrr!
> 
> 

Array initializers should work in GCC-2.95.X also, your syntax is just a
little off ...

$ cat foo.c
struct foo {
	int bar;
	int baz;
};
                                                                                
struct foo fufu[] = {
	[0] = {
		.bar = 0,
		.baz = 0
	},
};

$ gcc-2.95 -c foo.c
$
$ gcc-2.95 -v
Reading specs from /usr/lib/gcc-lib/i386-linux/2.95.4/specs
gcc version 2.95.4 20011002 (Debian prerelease)
$

The above foo.c compiles fine with gcc-3.2 and gcc-3.3 also. The C99
syntax should be no problem for gcc-2.95, or really any GCC release
after gcc-2.5, as gcc-2.5 is where the current documents say the syntax
with the ":" became obsolete.

Art Haas

-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
