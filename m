Received: from place.org
	([192.207.126.33] helo=zachs.place.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Mre1-0000TM-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2002 15:50:13 +0100
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Cc: cfowler <cfowler@outpostsentinel.com>,
	Gonzalo Servat <gonzalo@linuxaus.com>
Subject: Re: OpenSSH/OpenSSL is too big... any alternatives? 
In-Reply-To: Your message of "25 Jun 2002 10:43:30 EDT."
             <1025016211.25773.14.camel@moses.outpostsentinel.com>
References: <1025014199.2220.3.camel@beamer.servat.com>  <1025016211.25773.14.camel@moses.outpostsentinel.com> 
Date: Tue, 25 Jun 2002 09:50:11 -0500
From: Paul Jimenez <pj@place.org>
Message-Id: <20020625145011.DB9EF6B3F4@zachs.place.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

You might look at LSH, a smaller implementation, linked to off
of the uclibc page ( http://www.uclibc.org/uClibc-apps.html )
as being http://www.net.lut.ac.uk/psst/ .  No guarantees that it works..
it looks to be SSH v2 protocol, but not updated very recently.
My only connection with it is remembering that it existed on the above
uclibc page :)  Have fun,

  --pj

On Tuesday, Jun 25, 2002, cfowler writes:
>I got the same problem but I'm running off floppy.
>
>
>On Tue, 2002-06-25 at 10:09, Gonzalo Servat wrote:
>> Hi All
>> 
>> I have a 2MiB DiskOnChip. After installing the kernel, BusyBox, iptables
>> and a couple of libs from uClibc I only have 400k left of space.
>> OpenSSH needs to link to OpenSSL and OpenSSL is well over 1MB on it's
>> own. Is there any alternatives to OpenSSL/OpenSSH that will fit on 400k?
>> 
>> Thanks in advance!
>> 
>> Regards,
>> 
>> Gonzalo.
>> 
>> 
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
