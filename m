Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14kEVg-0003BL-00
	for mtd-list@infradead.org; Tue, 03 Apr 2001 01:17:24 +0100
Received: from 198.142.103.111.optusnet.com.au ([198.142.103.111] helo=powermac.ctam.local)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14kEVZ-0003AC-00
	for mtd@infradead.org; Tue, 03 Apr 2001 01:17:18 +0100
Message-ID: <3AC9245B.4000205@bigpond.com>
Date: Tue, 03 Apr 2001 11:16:11 +1000
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: Tim Bowman <tbowman@emware.com>
CC: mtd mailing list <mtd@infradead.org>
Subject: Re: RPX Classic/Lite and byte ordering
References: <3AC8E6A2.E0E43DC1@emware.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Nope.  A powerpc cross compiler *should* produce *exactly* the same code 
as a naitive compiler.  This assumes you are using exactly the same 
version of gcc, gas and glibc.  Having said that, I just remembered that 
the PowerPC architecture can be big endian or little endian.  There must 
be a configuration option when building the compilers that sets the 
default.  You should be able to specify which you want, either in the 
spec file or on the command line.

I've had a look at my spec file.  Try the -mbig-endian (or -mbig) for 
big endian.  Try -mlittle-endian (or -mlittle) for little endian.  I 
prefer -mbig-endian or -mlittle-endian because they are a lot clearer 
than -mbig or -mlittle.

My spec file has the following:

*multilib_defaults:
mbig mcall-linux

*cpp_endian_default:
%(cpp_endian_big)

*cc1_endian_default:
%(cc1_endian_big_spec)


Regards,
Brendan Simon.



Tim Bowman wrote:

> Would cross-compiling the kernel on an x86 produce different ordering
> than compiling natively on a PowerPC (which is how I am building it)? 
> Maybe I need to build it on an x86?





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
