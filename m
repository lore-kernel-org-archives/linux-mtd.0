Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from smtprch1.nortelnetworks.com ([192.135.215.14] helo=smtprch1.nortel.com)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11e9i2-0004MW-00
	for mtd@infradead.org; Thu, 21 Oct 1999 05:20:14 +0100
Message-ID: <380E92FB.743C3D9C@americasm01.nt.com>
Date: Wed, 20 Oct 1999 23:13:47 -0500
From: "Mark Ferrell" <mferrell@nortelnetworks.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: pmc551 status
Content-Type: multipart/alternative;
              boundary="------------58607DD46136C35F3093DB6E"
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


--------------58607DD46136C35F3093DB6E
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Anyway, I have what appears to be a very ruff around the edges driver
for the pmc551 cPCI Memory module by Ramix Inc.

The module detects the start address in memory and the onboard DRAM size
and all that crazy stuff and appears to work fairly well all in all.
Unfortunately I am having 'issues' w/ getting the mtdblock layer to work
on it.  Is there something special I should do far handling that?

If I load the mtd.o then the pmc551.o then then mtdblock.o I get a
kernel panic

If I load the mtd.o then the mtdblock.o then the pmc551.o everything
appears to work, but /dev/mtd0 is unussable.

Apon cat'ing /dev/mtd0 I get the following kernel messages

mtdblock_open
ok
mtdblock_open
ok

And that's it.  It opens the device for a short duration of time .. but
nothing comes forth.  I tried all sortsa fun with noluck.

Any ideas, suggestions, large bat's to beat the system about the head
with?

--
 Mark Ferrell  : mferrell@nortelnetworks.com
(972) 685-7868 : Desk
(972) 685-4210 : Lab
(972) 879-4326 : Pager



--------------58607DD46136C35F3093DB6E
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Anyway, I have what appears to be a very ruff around the edges driver for
the pmc551 cPCI&nbsp;Memory module by Ramix Inc.
<p>The module detects the start address in memory and the onboard DRAM
size and all that crazy stuff and appears to work fairly well all in all.&nbsp;
Unfortunately I am having 'issues' w/ getting the mtdblock layer to work
on it.&nbsp; Is there something special I should do far handling that?
<p>If I load the mtd.o then the pmc551.o then then mtdblock.o I&nbsp;get
a kernel panic
<p>If I&nbsp;load the mtd.o then the mtdblock.o then the pmc551.o everything
appears to work, but /dev/mtd0 is unussable.
<p>Apon cat'ing /dev/mtd0 I get the following kernel messages
<p>mtdblock_open
<br>ok
<br>mtdblock_open
<br>ok
<p>And that's it.&nbsp; It opens the device for a short duration of time
.. but nothing comes forth.&nbsp; I tried all sortsa fun with noluck.
<p>Any ideas, suggestions, large bat's to beat the system about the head
with?
<pre>--
&nbsp;Mark Ferrell&nbsp; : mferrell@nortelnetworks.com
(972) 685-7868 : Desk
(972) 685-4210 : Lab
(972) 879-4326 : Pager</pre>
&nbsp;</html>

--------------58607DD46136C35F3093DB6E--



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
