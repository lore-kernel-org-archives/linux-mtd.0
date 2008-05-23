Received: from rt-pi1-ru-sssup.pi1.garr.net ([193.206.136.46]
	helo=smtp2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRuM-0005O0-Gv
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:41:47 +0000
Message-ID: <4836750D.8030009@gandalf.sssup.it>
Date: Fri, 23 May 2008 09:41:01 +0200
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
References: <1211437223.6129.82.camel@Ubuntu-Desktop>	
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>	
	<1211524684.6203.13.camel@torchwood>	
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>	
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
In-Reply-To: <80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	James <jamessteward@optusnet.com.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Richard Genoud wrote:
> 2008/5/23 James <jamessteward@optusnet.com.au>:
>   
>> What tool chain are you using?
>>     
> i think it was buildroot + gcc3.4.6 and glib2.3.2, but i'm not sure.
>
> On Fri, 2008-05-23 at 09:03 +0200, Alessandro Rubini wrote:
>   
>> So you should only write the boot code with sam-ba, and write your
>> kernel and filesystem from either u-boot or linux. You'll probably
>> want to erase and re-program the boot loader from itself, to get rid
>> of remaining wrong sam-ba bits.
>>     
> I agree with Alessandro, don't rely to much on sam-ba for nand writing.
> That's why I asked you to do the test from linux (erase/mount/write/read)
>
>   
I'm agree too, but my customers use sam-ba to write (linux, u-boot
and jffs2 filesystem) without problems.

Regards
Michael
