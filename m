From: dwmw2@infradead.org (David Woodhouse)
Date: 13 Mar 2003 07:14:20 +0000
Subject: dnode of meta data
In-Reply-To: <000601c2e8ae$b46ea9a0$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
 <1047405009.24808.254.camel@passion.cambridge.redhat.com>
 <000601c2e8ae$b46ea9a0$210486da@ybb>
Message-ID: <1047539659.23182.18.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, 2003-03-12 at 15:47, matsunaga wrote:
> Thank you for the quick reaction. I would apreciate it.
> By the way, if you write a file, a dnode of meta data is written and obsoleted just after that.
> It consumes flash area(not much though) and might be caused by old fasioned format, 
> but could the process be omitted in advance?

Not easily. When you open and write a file, there are two separate
system calls -- open() and write().

JFFS2 is entirely synchronous -- we ensure that the results of a system
call have hit the medium before we return to the user. So optimising out
the 'metadata' node which holds the permissions and timestamps etc. of
the new file, and which exists before any data are written, isn't very
easy.

-- 
dwmw2
