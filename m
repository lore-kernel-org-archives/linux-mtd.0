Received: from cmailg5.svr.pol.co.uk ([195.92.195.175])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jydH-0002BV-O4
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 11:01:32 +0100
Message-ID: <010101c35b38$5a5916b0$c828a8c0@p450>
From: "Nick Bane" <nick@cecomputing.co.uk>
To: <manningc2@actrix.gen.nz>,
	"llandre" <r&d@wawnet.biz>
References: <5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
	<5.2.1.1.0.20030804110326.00c65950@dns.struinfo.it>
	<5.2.1.1.0.20030805091433.00c4e370@192.168.2.1>
Date: Tue, 5 Aug 2003 11:00:08 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: yaffs@toby-churchill.org
cc: linux-mtd@lists.infradead.org
cc: bakker@thorgal.et.tudelft.nl
Subject: Re: Can't load yaffs.o (unresolved symbol __get_mtd_device)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The yaffs mailing list archives are available and Wookey was going to do
something at either www.aleph1.co.uk or  www.balloonboard.org about it too I
think to provide them in a more digestible form.

To retrieve archive data send a mail to yaffs-request@toby-churchill.org
with the word "archive" as the *first* word of your Subject: line followed
by a command (or commands in the body test).

Note that the server is up for much of the day. The connection is broken
about 2 hourly but a reconnect attempt is made every 15 mins.

------- snippet from a howto of another list modified for
yaffs -------------
Take care to remove disclaimers and footers,
because the archive server might try to interpret these
lines and if he can't understand them, you'll get back
a help.txt. Instead of removing footers you can put
the 'quit' command in the body of the message before
your disclaimer and the archive server won't read your
disclaimer/footer.


The archive server knows the following commands:


You may put the following commands in the subject line
or in the body of a mail. If you put the commands in the body
you can send multiple commands in one mail. If you submit
a new software pointer don't put other commands in the body
of your message, they will be ignored.
Lines starting with a '#' are ignored.


get filename ...
  You will get the file 'filename' by email


ls directory ...
   You will get an overview of the directory 'directory'


egrep case_insensitive_regular_expression filename ...
   Will search the file 'filename' for the expression.
   Upper or lower case letters will be treated equal.

maxfiles nnn
   Set the maximum number of files that can sent to you to nnn.
   This will protect you from a flood of files if you do
   a get directory/*. Setting maxfiles to zero will remove the
   limit (to protect you against yourself no more than maxfiles
   files will be returned per request).

version
  Sends the version of the SmartList list server which is
  run here at redhat.com.


quit
  Terminates an archive request. This can be useful if you
  have a signature at the end of your message and don't want
  the archive server to interpret your signature.


Since this is a smart server, the following aliases are understood:
Aliases for 'get': send, sendme, getme, gimme, retrieve, mail
Aliases for 'ls': dir, directory, list, show
Aliases for 'egrep': search, grep, fgrep, find
Aliases for 'quit': exit


Egrep supports most common flags.
If you append a non-standard signature, you should use the quit
command to prevent the archive server from interpreting the signature.


Examples:


You want to get all the latest available mails which are stored in the
directory 'latest'. So you send the following mail:


<here begins the header>
To: yaffs-request@toby-churchill.org
Subject: archive get latest/*
<here ends the header>


You want to find out which files are available for you to get
from the main archive directory:


<here begins the header>
To: yaffs-request@toby-churchill.org
Subject: archive ls *
<here ends the header>


You are searching for the word 'scanner' in the latest
messages of axp-list. These messages are stored in the
subdirectory 'latest'. You are also searching for the word
'speech' in all messages of the main archive directory:


<here begins the header>
To: yaffs-request@toby-churchill.org
Subject: archive
<here ends the header>
egrep scanner latest/*
egrep speech *


------------- end -------------------

Once I get a fixed IP I'll move the list from Smartlist to Mailman and it
will be a bit simpler.

I have got yaffs running under 2.4.19-rmk4-tcl2 and 2.5.70-rmk1-tcl1 with
recent mtd code though the 2.5 stuff was broken. I'll rsync my 2.5 tree up
onto the tcl server shortly if that helps anyone.

Nick Bane

----- Original Message -----
From: "llandre" <r&d@wawnet.biz>
To: <manningc2@actrix.gen.nz>
Cc: <linux-mtd@lists.infradead.org>; <yaffs@toby-churchill.org>;
<bakker@thorgal.et.tudelft.nl>
Sent: Tuesday, August 05, 2003 8:28 AM
Subject: Re: Can't load yaffs.o (unresolved symbol __get_mtd_device)


>
> > > I'm using recent YAFFS sources downloaded via CVS on Aug, 1st with the
> > > kernel linuxppc_devel_2.4.21-pre5.
> > > I succesfully built the yaffs module but I can't load it with the
insmod
> > > command.
> > >
> > > Here what I get when trying to load:
> > >
> > > bash-2.05# /sbin/insmod -v yaffs.o
> > > Using yaffs.o
> > > Symbol version prefix ''
> > > yaffs.o: unresolved symbol __get_mtd_device
> > > bash-2.05#
> > >
> > > In the kernel's symbol list (System.map) I see the get_mtd_device
symbol.
> > > Why does the dynamic linker add two underscores '__'?
> > > How to solve the problem?
> >
> >I think you are using an inconsistent version of mtd.
> >
> >The mtd I have here (definitely not the latest!) exports the symbol
> >__get_mtd_device from mtdcore.c
>
> Charles,
>
> could you kindly send me the mtd you work with or tell me where I can
> download it?
>
>
> > >
> > > Thanx in advance and best regards.
> > >
> > > PS: I posted the message to the YAFFS's ml too, but unfortunately I
got no
> > > answers :-(
> >
> >Sorry I have been very ill the last two weeks.
>
> Sorry for my unkind statement. I did not mean to pretend an answer but I
> incorrectly thought this mailing list was almost abandoned (I clearly made
> a terrible mistake!). Is it a available on the web an archive (something
> like The linux-mtd Archives)?
>
> I apologize again and I thank for your help.
>
>
> llandre
>
>
> --------------------------------------------------------------------------
-------------
> This mailing list is hosted by Toby Churchill open software
(www.toby-churchill.org).
> If mailing list membership is no longer wanted you can remove yourself
from the list by
> sending an email to yaffs-request@toby-churchill.org with the text
"unsubscribe"
> (without the quotes) as the subject.
>
>
