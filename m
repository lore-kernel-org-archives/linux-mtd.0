Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKyEi-0004Qe-6D
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 17:00:00 +0000
Message-ID: <4966310C.1010103@grandegger.com>
Date: Thu, 08 Jan 2009 17:59:56 +0100
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
References: <496624A4.3050808@grandegger.com>	
	<alpine.LFD.2.00.0901081134110.6007@xanadu.home>
	<1231433317.28362.77.camel@macbook.infradead.org>
In-Reply-To: <1231433317.28362.77.camel@macbook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2009-01-08 at 11:47 -0500, Nicolas Pitre wrote:
>>> The NOR Flash memory K8P2815UQB from Samsung uses the major version
>>> number '0', which seems to be unusual but not illegal, IIUC. This
>>> patch removes the major-minor version check to get this Flash memory
>>> supported as well.
>> Instead of removing the test entirely, I'd suggest you augment it with 
>> the manufacturer ID (cfi->mfr and cfi->id).  Or better yet, just use 
>> that information to fix up the version number to something sensible.
> 
> Couldn't you use a quirk to do the latter?

The major/minor version number is not used anywhere else and therefore a
quirk seems to be overkill too me. But we may want to keep the message:

  Unknown Amd/Fujitsu Extended Query version 0.0.

Wolfgang.
