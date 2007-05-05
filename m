Received: from wx-out-0506.google.com ([66.249.82.238])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HkJLj-0001Vi-UO
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 08:26:58 -0400
Received: by wx-out-0506.google.com with SMTP id t8so1023785wxc
	for <linux-mtd@lists.infradead.org>;
	Sat, 05 May 2007 05:26:54 -0700 (PDT)
Message-ID: <a781481a0705050526r13445d60j737a6c2015402dcc@mail.gmail.com>
Date: Sat, 5 May 2007 17:56:50 +0530
From: "Satyam Sharma" <satyam.sharma@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
In-Reply-To: <1178351711.3659.54.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <463A04A5.5030103@gmail.com>
	<a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
	<463BC019.40305@gmail.com>
	<a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
	<1178351711.3659.54.camel@sauron>
Cc: Florin Malita <fmalita@gmail.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/5/07, Artem Bityutskiy <dedekind@infradead.org> wrote:
> [...]
> On Sat, 2007-05-05 at 09:25 +0530, Satyam Sharma wrote:
> > Artem would have to step in here to verify if there really is a good
> > reason why we kmalloc a fresh ubi_scan_leb every time we want to add
> > one to a list.
> Particularly in vtbl.c there is no good reason. Leftover of itsy-bitsy
> units. I'll make ubi_scan_add_to_list static, as well as
> ubi_scan_add_used(). And I'll rename them to something shorter. They are
> only useful in scan.c.
>
> And it is fine to use list_add_tail() directly in vtbl.c. Will be fixed.

Ah, good to know that, but please keep list_add_tail (or whatever is
the implementation abstraction of the various ubi_scan_info lists)
local to scan.c -- you could expose a version of ubi_scan_add_to_list
that does not do kmalloc through scan.h and use that in vtbl.c. That
way you won't lose those debug printk's when adding an eraseblock to a
list, for example, and it's always much cleaner not exposing an
object's implementation innards to others.

> > >though this likely requires a
> > major cleanup of this driver w.r.t. ubi_scan_leb lifetime semantics.
> What is wrong with the semantics, please be more specific.

It's wrong to be allocating and freeing any object in more than one
place . Physical eraseblocks are allocated in ubi_scan_add_to_list
(which shouldn't be doing that) and ubi_scan_add_used (which is a
maze) and freed pretty much all over the place (because we allocate
new seb's for ourselves to add to the lists, we need to go about
kfree'ing all of them when destroying a ubi_scan_destroy_si too, for
example -- perhaps this driver needs to be told about krefs). So it
makes life easier if you know there's only one place when/where an
object is born, if you know that it'll remain alive as long as you
need it and have a reference on it, and if you destroy it a known
single time/location too. I wish I could be more specific than this,
but I've only spent a few hours with ubi :-)
