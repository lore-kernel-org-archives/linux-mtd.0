Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgNok-0000x7-EW
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 09:11:03 -0400
Date: Fri, 2 Jul 2004 09:06:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1088773179.14216.4373.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.60.0407020904300.5342@localhost.localdomain>
References: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
	<1088773179.14216.4373.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: adding cmd-line partitioning to rpxlite.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 Jul 2004, David Woodhouse wrote:

> On Fri, 2004-07-02 at 08:26 -0400, Robert P. J. Day wrote:
>> these name values have embedded spaces.  how exactly does that work in
>> trying to use command-line partitioning here?  or did i misread how to
>> specify the <mtddef> field on the the command line?
>>
>> or, to be more brief, how would one use command-line partitioning for
>> lubbock-flash.c?  i'm going to do a more careful re-reading of
>> cmdlinepart.c to see what i missed.  thanks.
>
> I don't know if or how it work. Perhaps there's a way to escape stuff on
> the command line, or perhaps it just doesn't work.

ok, i'll take a closer look at how the cmdline partitioning parser 
works.  there are a number of maps source files that use embedded 
spaces in their map_info.name fields, but a lot of them don't bother 
with the option of parsing the command line.

i'll just keep things simple for my test example.

rday
