From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 3 Mar 2003 22:06:13 +0100
Subject: [PATCH] C99 initializers for drivers/mtd files
In-Reply-To: <1046724566.2672.634.camel@tubarao>
References: <20030226205334.GB8966@debian> <20030227194424.GC29233@wohnheim.fh-wedel.de> <20030227214646.GD8116@debian> <20030302185616.GC10681@wohnheim.fh-wedel.de> <1046724566.2672.634.camel@tubarao>
Message-ID: <20030303210613.GA7875@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 3 March 2003 13:49:27 -0700, Thayne Harbaugh wrote:
> 
> GCC 2.95 does not understand C99 and will fail to compile kernels
> that require this syntax.

You had me for a moment. But at least Debians gcc 2.95.4 does not fail
too badly:

joern at Limerick:~/foo$ cat foo.c
struct foo {
        int bar;
        int baz;
};

struct foo fufu = {
        .bar = 0,
        .baz = 0
};
joern at Limerick:~/foo$ gcc --version
2.95.4
joern at Limerick:~/foo$ gcc -c foo.c
joern at Limerick:~/foo$ ls
foo.c  foo.o
joern at Limerick:~/foo$  

What compiler do you have that breaks with C99 initializers?

J?rn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
