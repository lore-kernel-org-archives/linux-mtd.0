From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Thu, 27 Mar 2003 15:51:27 +0100
Subject: Unable to handle kernel paging request at virtual address 80000013
In-Reply-To: <1048774361.14203.145.camel@passion.cambridge.redhat.com>
References: <3E8303F3.980B0F02@thales-e-transactions.com> <1048774361.14203.145.camel@passion.cambridge.redhat.com>
Message-ID: <20030327145127.GB25094@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 27 March 2003 14:12:41 +0000, David Woodhouse wrote:
> 
> You didn't bother to decode the oops. I can't be bothered to speculate.

In case you don't know how (newbie, as you say), install ksymoops,
read the manpage and use it. For cross-development, you can use the
host ksymoops and point it to the appropriate files.

J?rn

-- 
It's just what we asked for, but not what we want!
-- anonymous
