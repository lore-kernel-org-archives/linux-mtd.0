Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PgP1t-00076H-4s
	for linux-mtd@lists.infradead.org; Fri, 21 Jan 2011 22:00:27 +0000
Received: by bwz5 with SMTP id 5so1985263bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Jan 2011 14:00:23 -0800 (PST)
Subject: Re: [PATCH 2/2] Add new tuneubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefani Seibold <stefani@seibold.net>
In-Reply-To: <1295349012.2470.130.camel@koala>
References: <1295341465-2468-1-git-send-email-stefani@seibold.net>
	<1295341465-2468-3-git-send-email-stefani@seibold.net>
	<1295347984.2470.124.camel@koala>  <1295348699.31317.0.camel@wall-e>
	<1295349012.2470.130.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 Jan 2011 00:00:19 +0200
Message-ID: <1295647219.3712.6.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-18 at 13:10 +0200, Artem Bityutskiy wrote:
> On Tue, 2011-01-18 at 12:04 +0100, Stefani Seibold wrote:
> > Would be great if you can fix it. I have no idea what you mean.
> 
> It is ok to ask me to do this for you but it is not very fair to say you
> have no idea what I mean because I did described it in enough details.
> At least enough to ask specific questions :-)
> 
> Anyway, let's see if I can do this, no promises but I'll try. If I
> cannot, I'll e-mail you.

Ok, I've tried it - spent 20 minutes and realized there are many issues
which should be fixed, and I do not feel like doing this sorry.

Just few - error path is bad, a lot of unneeded code, including whole
"translate_dev' function, 3 input parameters which should be killed, not
checking error code of 'update_super()', --compr is -c in long option
and -x in short.

Sorry, I really do not feel like cleaning it up, so I prefer to wait
when you find some time to do this. Here is the diff of the changes I
started doing but then stopped half way through - it does not even
compile, I'm sharing it just in case.


diff --git a/ubifs-utils/tuneubifs.c b/ubifs-utils/tuneubifs.c
index 6e3f73f..27d4807 100644
--- a/ubifs-utils/tuneubifs.c
+++ b/ubifs-utils/tuneubifs.c
@@ -21,10 +21,9 @@
  * Author: Stefani Seibold <stefani@seibold.net>
  *         in order of NSN Nokia Siemens Networks Ulm/Germany
  *         based on work by Artem Bityutskiy
- *
  */
 
-#define PROGRAM_VERSION "0.4"
+#define PROGRAM_VERSION "1.0"
 #define PROGRAM_NAME "tuneubifs"
 
 #define _GNU_SOURCE
@@ -74,13 +73,9 @@ static struct args args = {
 	.verbose = 0,
 };
 
-static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
-			 " - a tool for UBI filesystem tuning.";
+static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION " - UBIFS tuning tool";
 
 static const char optionsstr[] =
-"-d, --devn=<UBI device number>  UBI device number to tune\n"
-"-n, --vol_id=<volume ID>        ID of UBI volume to tune\n"
-"-N, --name=<volume name>        name of UBI volume to tune\n"
 "-x, --compr=<none|lzo|zlib>     compression type\n"
 "-R, --reserved=SIZE             how much space should be reserved for super-user\n"
 "-v, --verbose                   verbose output\n"
@@ -88,20 +83,14 @@ static const char optionsstr[] =
 "-V, --version                   print program version";
 
 static const char usage[] =
-"Usage 1: " PROGRAM_NAME " [-d <UBI device number>] [-n <volume ID> | -N <volume name>]\n"
-"\t\t[-h] [-V] [--vol_id=<volume ID> | --name <volume name>]\n"
-"\t\t[--devn <UBI device number>] [--help] [--version]\n"
-"Usage 2: " PROGRAM_NAME " <UBI volume node file name> [-h] [-V] [--help] [--version]\n\n";
+"Usage: " PROGRAM_NAME " <UBI volume device node> [-x <compr> [-R <size>] [-v] [-h] [-V]";
 
 static const struct option long_options[] = {
-	{ .name = "devn",      .has_arg = 1, .flag = NULL, .val = 'd' },
-	{ .name = "vol_id",    .has_arg = 1, .flag = NULL, .val = 'n' },
-	{ .name = "name",      .has_arg = 1, .flag = NULL, .val = 'N' },
+	{ .name = "compr",     .has_arg = 1, .flag = NULL, .val = 'x' },
+	{ .name = "reserved",  .has_arg = 1, .flag = NULL, .val = 'R' },
+	{ .name = "verbose",   .has_arg = 0, .flag = NULL, .val = 'v' },
 	{ .name = "help",      .has_arg = 0, .flag = NULL, .val = 'h' },
 	{ .name = "version",   .has_arg = 0, .flag = NULL, .val = 'V' },
-	{ .name = "compr",     .has_arg = 1, .flag = NULL, .val = 'c' },
-	{ .name = "reserved",  .has_arg = 1, .flag = NULL, .val = 'r' },
-	{ .name = "verbose",   .has_arg = 0, .flag = NULL, .val = 'v' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -173,38 +162,11 @@ static int parse_opt(int argc, char * const argv[])
 		int key;
 		char *endp;
 
-		key = getopt_long(argc, argv, "an:N:d:hVx:R:v", long_options, NULL);
+		key = getopt_long(argc, argv, "x:R:vhV", long_options, NULL);
 		if (key == -1)
 			break;
 
 		switch (key) {
-		case 'n':
-			args.vol_id = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.vol_id < 0)
-				return errmsg("bad volume ID: " "\"%s\"", optarg);
-			break;
-
-		case 'N':
-			args.vol_name = optarg;
-			break;
-
-		case 'd':
-			args.devn = strtoul(optarg, &endp, 0);
-			if (*endp != '\0' || endp == optarg || args.devn < 0)
-				return errmsg("bad UBI device number: \"%s\"", optarg);
-
-			break;
-
-		case 'h':
-			fprintf(stderr, "%s\n\n", doc);
-			fprintf(stderr, "%s\n\n", usage);
-			fprintf(stderr, "%s\n", optionsstr);
-			exit(EXIT_SUCCESS);
-
-		case 'V':
-			fprintf(stderr, "%s\n", PROGRAM_VERSION);
-			exit(EXIT_SUCCESS);
-
 		case 'x':
 			if (!strcmp(optarg, "none"))
 				args.compr = UBIFS_COMPR_NONE;
@@ -216,13 +178,22 @@ static int parse_opt(int argc, char * const argv[])
 				args.compr = UBIFS_COMPR_ZLIB;
 			else
 				return errmsg("bad compr type: \"%s\"", optarg);
-
 			break;
 
 		case 'R':
 			args.reserved = get_bytes(optarg);
 			break;
 
+		case 'h':
+			fprintf(stderr, "%s\n\n", doc);
+			fprintf(stderr, "%s\n\n", usage);
+			fprintf(stderr, "%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			fprintf(stderr, "%s\n", PROGRAM_VERSION);
+			exit(EXIT_SUCCESS);
+
 		case 'v':
 			args.verbose = 1;
 			break;
@@ -236,49 +207,15 @@ static int parse_opt(int argc, char * const argv[])
 		}
 	}
 
-	if (optind == argc - 1)
-		args.node = argv[optind];
-	else if (optind < argc)
-		return errmsg("more then one UBI device specified (use -h for help)");
-
-	return 0;
-}
-
-static int translate_dev(libubi_t libubi, const char *node)
-{
-	int err;
-
-	err = ubi_probe_node(libubi, node);
-	if (err == -1) {
-		if (errno != ENODEV)
-			return sys_errmsg("error while probing \"%s\"", node);
-		return errmsg("\"%s\" does not correspond to any UBI device or volume", node);
-	}
-
-	if (err == 1) {
-		struct ubi_dev_info dev_info;
-
-		err = ubi_get_dev_info(libubi, node, &dev_info);
-		if (err)
-			return sys_errmsg("cannot get information about UBI device \"%s\"", node);
-
-		args.devn = dev_info.dev_num;
-	} else {
-		struct ubi_vol_info vol_info;
-
-		err = ubi_get_vol_info(libubi, node, &vol_info);
-		if (err)
-			return sys_errmsg("cannot get information about UBI volume \"%s\"", node);
-
-		if (args.vol_id != -1)
-			return errmsg("both volume character device node (\"%s\") and "
-			   "volume ID (%d) are specify, use only one of them"
-			   "(use -h for help)", node, args.vol_id);
-
-		args.devn = vol_info.dev_num;
-		args.vol_id = vol_info.vol_id;
+	if (optind == argc) {
+		errmsg("UBI volume character device was not specified (use -h for help)");
+		return -1;
+	} else if (optind != argc - 1) {
+		errmsg("more then one charactar device specified (use -h for help)");
+		return -1;
 	}
 
+	args.node = argv[optind];
 	return 0;
 }
 
@@ -405,7 +342,6 @@ int main(int argc, char * const argv[])
 {
 	int err;
 	libubi_t libubi;
-	char devname[128];
 	int fd;
 
 	err = parse_opt(argc, argv);
@@ -419,43 +355,12 @@ int main(int argc, char * const argv[])
 		return sys_errmsg("cannot open libubi");
 	}
 
-	if (args.node) {
-		/*
-		 * A character device was specified, translate this into UBI
-		 * device number and volume ID.
-		 */
-		err = translate_dev(libubi, args.node);
-		if (err)
-			goto out_libubi;
-	}
-
-	if (args.devn == -1) {
-		errmsg("device number is missing (use -h for help)\n");
-		goto out_libubi;
-	}
-
-	err = ubi_get_dev_info1(libubi, args.devn, &dev_info);
+	err = ubi_get_dev_info(libubi, args.node, &dev_info);
 	if (err) {
-		errmsg("cannot get information about UBI device %d", args.devn);
+		errmsg("cannot get information about UBI device %s", args.name);
 		goto out_libubi;
 	}
 
-	if (args.vol_name) {
-		err = get_vol_id_by_name(libubi, args.devn, args.vol_name);
-		if (err)
-			goto out_libubi;
-	}
-
-	if (args.vol_id == -1) {
-		errmsg("volume ID is missing (use -h for help)\n");
-		goto out_libubi;
-	}
-
-	if (!args.node) {
-		sprintf(devname, "/dev/ubi%d_%d", args.devn, args.vol_id);
-		args.node = devname;
-	}
-
 	super_buf = malloc(dev_info.leb_size);
 	if (!super_buf) {
 		errmsg("out of memory");
@@ -465,12 +370,12 @@ int main(int argc, char * const argv[])
 	fd = open(args.node, O_RDWR|O_EXCL);
 	if (fd == -1) {
 		errmsg("cannot open the UBI volume '%s'", args.node);
-		goto out_libubi;
+		goto out_free;
 	}
 
 	err = read_super(fd, super_buf);
 	if (err)
-		goto out_libubi;
+		goto out_close;
 
 	if (args.compr != -1 || args.reserved != -1)
 		update_super(libubi, fd, super_buf);
@@ -483,9 +388,15 @@ int main(int argc, char * const argv[])
 	if (err)
 		goto out_libubi;
 
+	close(fd);
+	free(super_buf);
 	libubi_close(libubi);
 	return 0;
 
+out_close:
+	close(fd);
+out_free:
+	free(super_buf);
 out_libubi:
 	libubi_close(libubi);
 	return -1;


-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
