From: Russ.Dill@asu.edu (Russ Dill)
Date: Tue, 11 Mar 2003 00:54:25 -0700
Subject: Unexpected problems in rebuilding kernel
In-Reply-To: <000201c2e770$8d71e400$e3c8580c@who5>
References: <000201c2e770$8d71e400$e3c8580c@who5>
Message-ID: <1047368655.1782.1.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-10 at 18:50, Gregg C Levine wrote:
> Hello from Gregg C Levine
> Something new to report. I am now working my way through the kernel
> rebuilding, and it is failing on a specific point. I am posting it, as
> a text file attachment. Basically the process decides to abort
> complaining about a macro, in the jffs file system. This is a patched
> 2.4.20 kernel, after running a the patchin.sh script from the patches
> directory.

Don't build jffs, you probably don't want to use it, and its probably
behind (and thus the macro problems).
