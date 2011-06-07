Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTqoN-0003rV-2J
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 07:34:52 +0000
Received: by ewy3 with SMTP id 3so1973082ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 00:34:49 -0700 (PDT)
Subject: Re: [PATCH 4/6] libmtd: add helper funcs for getting fds,
	regioninfo, and locked info
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <BANLkTi=AaX1aSeHM5CLhh8XujKCUysWRhw@mail.gmail.com>
References: <1307427548-29306-1-git-send-email-vapier@gentoo.org>
	<1307427548-29306-4-git-send-email-vapier@gentoo.org>
	<1307429436.11104.43.camel@localhost>
	<1307429769.11104.47.camel@localhost>
	<BANLkTi=AaX1aSeHM5CLhh8XujKCUysWRhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 10:30:32 +0300
Message-ID: <1307431832.11104.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 03:04 -0400, Mike Frysinger wrote:
> On Tue, Jun 7, 2011 at 02:56, Artem Bityutskiy wrote:
> > On Tue, 2011-06-07 at 09:50 +0300, Artem Bityutskiy wrote:
> >> We indeed have -m option in mtdutils which opens a device by its number.
> >> But I think it was a mistake. Generally, MTD devices can have any name,
> >> it is up to udev configuration. So I'd rather deprecate and would
> >> require a list of device node names.
> >
> > Sorry, I was not clear. I wanted to say that supports -m and does
> > hard-code the mtd device name. But this was a mistake because it gives a
> > bad example, and adding more hard-coded names is bad.
> >
> > So I think this option can be deprecated and removed, and we should only
> > accept full device node names.
> 
> i only added this because mtdinfo has the -m option.  i have no
> problem with punting that and going back to requiring people to
> specify the path to the device nodes.  i'm off now though, so i'll get
> to it tomorrow.

Thanks! I've just pushed the following patch which deprecates it:

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 7 Jun 2011 10:36:26 +0300
Subject: [PATCH] mtdinfo: deprecate the -m option

... because mtd device node name do not have to follow the "/dev/mtd%d"
pattern.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 feature-removal-schedule.txt |    9 +++++++--
 ubi-utils/src/mtdinfo.c      |    3 ++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 30f0403..6e2bfc9 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -20,11 +20,16 @@ neither --squash-rino-perm nor --nosquash-rino-perm were used,
 mkfs.ubifs printed a warning. This was introduced in mtd-utils-1.4.0 (13 Sep 2010).
 
 Now we have removed a warning and made --nosquash-rino-perm to be the
-default. Also, both options are declared depricated, so users should try
+default. Also, both options are declared deprecated, so users should try
 to stop using them.
 
 The further step is to remove both of them.
 
 ---------------------------
-2.
+2. Kill -m parameter of mtdinfo
+
+We cannot assume that mtd device names follow the "/dev/mtd%d" pattern,
+because it is up to udev rules to name the devices. So we are removing
+the -m option. For now, we just have a warning, but the option will be
+removed in release 1.4.6.
 ---------------------------
diff --git a/ubi-utils/src/mtdinfo.c b/ubi-utils/src/mtdinfo.c
index c9f6f58..820c16d 100644
--- a/ubi-utils/src/mtdinfo.c
+++ b/ubi-utils/src/mtdinfo.c
@@ -56,6 +56,7 @@ static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 
 static const char optionsstr[] =
 "-m, --mtdn=<MTD device number>  MTD device number to get information about\n"
+"                                (deprecated option, will be removed, do not use)\n"
 "-u, --ubi-info                  print what would UBI layout be if it was put\n"
 "                                on this MTD device\n"
 "-a, --all                       print information about all MTD devices\n"
@@ -106,7 +107,7 @@ static int parse_opt(int argc, char * const argv[])
 			args.mtdn = simple_strtoul(optarg, &error);
 			if (error || args.mtdn < 0)
 				return errmsg("bad MTD device number: \"%s\"", optarg);
-
+			warnmsg("-m/--mtdn is depecated, will be removed in mtd-utils-1.4.6");
 			break;
 
 		case 'h':
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
