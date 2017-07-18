Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXUnF-0006h2-Le
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 15:52:15 +0000
Subject: Re: [PATCH] mtdcore: Infrastructure for the device release API
To: Brian Norris <computersforpeace@gmail.com>
References: <20170518092248.23934.15034.stgit@mh-desktop.uk.solarflarecom.com>
 <20170527001323.GF114788@google.com>
 <7b7511f7-4380-fd3e-703e-8e50a3fcc265@solarflare.com>
 <1f68fe2b-b546-9c9f-03ee-2b90ba382038@solarflare.com>
 <20170708014714.GG55942@google.com>
CC: <linux-mtd@lists.infradead.org>
From: Martin Habets <mhabets@solarflare.com>
Message-ID: <b80b6106-d953-6a66-ddfb-68b52b42e53b@solarflare.com>
Date: Tue, 18 Jul 2017 16:51:32 +0100
MIME-Version: 1.0
In-Reply-To: <20170708014714.GG55942@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/07/17 02:47, Brian Norris wrote:
> On Thu, Jun 22, 2017 at 02:54:07PM +0100, Martin Habets wrote:
>> Brian, any opinion about this?
> 
> I'm sure this is all awesome, but I haven't seen a patch that utilizes
> this. It's save me some mental energy of trying to figure out what all
> is supposed to be happening here if I had one.

I can cook up a patch for mtdpart.c, but I cannot test it since I do not have any
hardware that uses this. Or maybe this is enough reason that I should post my
patch for the sfc driver here.
In fact I'll probably post both those patches here.

> Or this can wait until I've spent more time trying to figure out what
> you're trying to do with this. And I haven't proven myself to spend a
> lot of time looking at your patches so far ;)

The easy step is to build a kernel with CONFIG_DEBUG_KOBJECT_RELEASE enabled,
the tricky bit is to analyse the output it spews into dmesg when a module that
uses mtd is unloaded.

Martin
