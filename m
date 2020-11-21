Return-Path: <SRS0=xNak=E3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B46C388F9
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8893720575
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:43:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3PVcULGa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iWjdqq01";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MppheyFH";
	dkim=neutral (0-bit key) header.d=redhat.com header.i=@redhat.com header.b="MppheyFH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8893720575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++Px1Y1p0olQxB1IQF+SR0IBh9qvY9tgAxFO5sdKDZU=; b=3PVcULGanGgLuZNvrhKRyJhRIL
	UztKUYIXduQQp3OFfYYDV4sxqjMZGEwfEex4ZfYgUUnniTgDuvJ5mPzFnD7Oo5EePTNAW2YkRIc5B
	qYt44RdaDNkUz0lbZo+xvcAYw/JYhDThbIekXqkJIXuhSCTEVmPXumQiAMLLWZ+wNnOAIZW5ODrJK
	ALzS1V3PTbUPObAih3gsNIA3CPmcxoHHd4p/80j5aE2KLPUduerKk5s/uoh15qkgtbKVgzp1ULCJM
	uCbPmEYBGKz8SExUHhalJiZMiqDcqgbEy6xHJWXolVOIQZmBClluqMzYAwlryoC0UjA/+mBywBSU/
	EAL/q6xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcWM-0006C6-EA; Sat, 21 Nov 2020 23:42:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcW7-00068V-2j
 for linux-mtd@merlin.infradead.org; Sat, 21 Nov 2020 23:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Message-Id:Date:Subject:Cc
 :To:From:Sender:Reply-To:MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=zLH0U0S3qPuM/4/c12zDySDpu72UCHtVP0nLwv0orcI=; b=iWjdqq01SPJm3rWghpx9Y4i5h/
 DOVAmIkPuyUZDzUVNVt6PG50+PXecYLKTXq12d5x9z8VB6/BZuzuSP3t8hMBSPkXE/M27aCYtWIUP
 KObBpBFUNykln01v/CRzQCo7jKTP8MErE69eveGb/glwM7k5sdKj1DPDma64q1J9Vp1kFM8J7qCtf
 oJ5mo8FqZtdlrXVg+ProXdojV/c+I2xDewteWAw6sHKPsCZi8VcF3qdzScRfyQZP9mXkPxxhtco0p
 aYjOPbdhARfcYHzZgyAJwte35w7jyYToSrVdDWCWjeMoK96Src2gNQy3KofjpiIocLjW94Iogb5Sf
 76cvUZDA==;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgW8I-0002qT-IC
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2020 16:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605977583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=zLH0U0S3qPuM/4/c12zDySDpu72UCHtVP0nLwv0orcI=;
 b=MppheyFHIP/hrGU9nhddy1F4x+07kT9fUdvzRVVHROnL4Gl2FVHQqb+rsZhU8gAruxZFTu
 HzfAR3yIJsQu4MfgrF37pKkoxgACUJEQEOI7I64tP6ZJ5a61zpbZhRCW+Dj8QyX5giXPoN
 DAAswfM5/shazCt2wC/e9Y1cQLFLa0E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605977583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=zLH0U0S3qPuM/4/c12zDySDpu72UCHtVP0nLwv0orcI=;
 b=MppheyFHIP/hrGU9nhddy1F4x+07kT9fUdvzRVVHROnL4Gl2FVHQqb+rsZhU8gAruxZFTu
 HzfAR3yIJsQu4MfgrF37pKkoxgACUJEQEOI7I64tP6ZJ5a61zpbZhRCW+Dj8QyX5giXPoN
 DAAswfM5/shazCt2wC/e9Y1cQLFLa0E=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-ZB4JAckBM8OAVqbRdTQ_bg-1; Sat, 21 Nov 2020 11:51:08 -0500
X-MC-Unique: ZB4JAckBM8OAVqbRdTQ_bg-1
Received: by mail-qk1-f197.google.com with SMTP id q25so10876053qkm.17
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2020 08:51:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zLH0U0S3qPuM/4/c12zDySDpu72UCHtVP0nLwv0orcI=;
 b=iM1YsmAaRldLgwr15nv/+rvlJtGPohNQScT2PzTrFTndm/BcvmCkgI2OMncASyDYXQ
 XX+r234CrYknFSNf9Kisguj8tPumjomgjntdVZAMfcHr8whvv0nRppdyji9sSts4NH2f
 7I5w0Lny4qFGMOTEm6PyFYYVAwWMqZwC/n2lqSwRriu0vxONCDUOBcdM/qOJZoVKkjoQ
 SZMM2xxEPWfV0CiWWVD1DEL0hn9jC9pUBLLTgaQNKJY9FbbmtA4mCIQJt8ipY4OOFvF0
 /+KGf6OPvg19267VPwTQFaaovoD8YBmUN+UIz5NLu2Mi+9Y5CVdjw0jDQ63R89cKgGUs
 qiXA==
X-Gm-Message-State: AOAM532LApxu1vHVmNDwRIasYYUrVa6Hvc7Go28f978K3tMmZiyhBWwX
 ZDzl4/ZoxesU1/fg54QrhkbuaJ/wcXYZAv4kKTh0NhMveNRg9X4XxZ2BZ9YgZvyUocF8dbtNJfH
 mL8/AL6nUEgKqLRivkqbXruAL4w==
X-Received: by 2002:a05:620a:15ce:: with SMTP id
 o14mr22885260qkm.231.1605977467693; 
 Sat, 21 Nov 2020 08:51:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJMB7Phx6GdQ/NzrSSCIOwTBjDbbn+gugDtHjIEeXte769cdu0l51J2LUn/+h4QxN+fnLujw==
X-Received: by 2002:a05:620a:15ce:: with SMTP id
 o14mr22885248qkm.231.1605977467468; 
 Sat, 21 Nov 2020 08:51:07 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id j202sm4129196qke.108.2020.11.21.08.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 08:51:06 -0800 (PST)
From: trix@redhat.com
To: trix@redhat.com,
	joe@perches.com,
	clang-built-linux@googlegroups.com
Subject: [RFC] MAINTAINERS tag for cleanup robot
Date: Sat, 21 Nov 2020 08:50:58 -0800
Message-Id: <20201121165058.1644182-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_165306_898905_FDA5985E 
X-CRM114-Status: GOOD (  17.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A difficult part of automating commits is composing the subsystem
preamble in the commit log.  For the ongoing effort of a fixer producing
one or two fixes a release the use of 'treewide:' does not seem appropriate.

It would be better if the normal prefix was used.  Unfortunately normal is
not consistent across the tree.

So I am looking for comments for adding a new tag to the MAINTAINERS file

	D: Commit subsystem prefix

ex/ for FPGA DFL DRIVERS

	D: fpga: dfl:

Continuing with cleaning up clang's -Wextra-semi-stmt

A significant number of warnings are caused by function like macros with
a trailing semicolon.  For example.

#define FOO(a) a++; <-- extra, unneeded semicolon
void bar() {
	int v = 0;
	FOO(a);
} 

Clang will warn at the FOO(a); expansion location. Instead of removing
the semicolon there,  the fixer removes semicolon from the macro
definition.  After the fixer, the code will be:

#define FOO(a) a++
void bar() {
	int v = 0;
	FOO(a);
} 

The fixer review is
https://reviews.llvm.org/D91789

A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
The false positives are caused by macros passed to other macros and by
some macro expansions that did not have an extra semicolon.

This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
warnings in linux-next.

An update to [RFC] clang tooling cleanup
This change adds the clang-tidy-fix as a top level target and
uses it to do the cleaning.  The next iteration will do a loop of
cleaners.  This will mean breaking clang-tidy-fix out into its own
processing function 'run_fixers'.

Makefile: Add toplevel target clang-tidy-fix to makefile

Calls clang-tidy with -fix option for a set of checkers that
programatically fixes the kernel source in place, treewide.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 Makefile                               |  7 ++++---
 scripts/clang-tools/run-clang-tools.py | 20 +++++++++++++++++---
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 47a8add4dd28..57756dbb767b 100644
--- a/Makefile
+++ b/Makefile
@@ -1567,20 +1567,21 @@ help:
 	 echo  ''
 	@echo  'Static analysers:'
 	@echo  '  checkstack      - Generate a list of stack hogs'
 	@echo  '  versioncheck    - Sanity check on version.h usage'
 	@echo  '  includecheck    - Check for duplicate included header files'
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
 	@echo  '  clang-analyzer  - Check with clang static analyzer'
 	@echo  '  clang-tidy      - Check with clang-tidy'
+	@echo  '  clang-tidy-fix  - Check and fix with clang-tidy'
 	@echo  ''
 	@echo  'Tools:'
 	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
 	@echo  ''
 	@echo  'Kernel selftest:'
 	@echo  '  kselftest         - Build and run kernel selftest'
 	@echo  '                      Build, install, and boot kernel before'
 	@echo  '                      running kselftest on it'
 	@echo  '                      Run as root for full coverage'
 	@echo  '  kselftest-all     - Build kernel selftest'
@@ -1842,30 +1843,30 @@ nsdeps: modules
 quiet_cmd_gen_compile_commands = GEN     $@
       cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
 
 $(extmod-prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
 	$(if $(KBUILD_EXTMOD),,$(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)) \
 	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
 	$(call if_changed,gen_compile_commands)
 
 targets += $(extmod-prefix)compile_commands.json
 
-PHONY += clang-tidy clang-analyzer
+PHONY += clang-tidy-fix clang-tidy clang-analyzer
 
 ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
       cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
 
-clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
+clang-tidy-fix clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
 	$(call cmd,clang_tools)
 else
-clang-tidy clang-analyzer:
+clang-tidy-fix clang-tidy clang-analyzer:
 	@echo "$@ requires CC=clang" >&2
 	@false
 endif
 
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
 PHONY += includecheck versioncheck coccicheck export_report
 
 includecheck:
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index fa7655c7cec0..c177ca822c56 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -22,43 +22,57 @@ def parse_arguments():
     Returns:
         args: Dict of parsed args
         Has keys: [path, type]
     """
     usage = """Run clang-tidy or the clang static-analyzer on a
         compilation database."""
     parser = argparse.ArgumentParser(description=usage)
 
     type_help = "Type of analysis to be performed"
     parser.add_argument("type",
-                        choices=["clang-tidy", "clang-analyzer"],
+                        choices=["clang-tidy-fix", "clang-tidy", "clang-analyzer"],
                         help=type_help)
     path_help = "Path to the compilation database to parse"
     parser.add_argument("path", type=str, help=path_help)
 
     return parser.parse_args()
 
 
 def init(l, a):
     global lock
     global args
     lock = l
     args = a
 
 
 def run_analysis(entry):
     # Disable all checks, then re-enable the ones we want
     checks = "-checks=-*,"
-    if args.type == "clang-tidy":
+    fix = ""
+    header_filter = ""
+    if args.type == "clang-tidy-fix":
+        checks += "linuxkernel-macro-trailing-semi"
+        #
+        # Fix this
+        # #define M(a) a++; <-- clang-tidy fixes the problem here
+        # int f() {
+        #   int v = 0;
+        #   M(v);  <-- clang reports problem here
+        #   return v;
+        # }
+        fix += "-fix"
+        header_filter += "-header-filter=.*"
+    elif args.type == "clang-tidy":
         checks += "linuxkernel-*"
     else:
         checks += "clang-analyzer-*"
-    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
+    p = subprocess.run(["clang-tidy", "-p", args.path, checks, header_filter, fix, entry["file"]],
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT,
                        cwd=entry["directory"])
     with lock:
         sys.stderr.buffer.write(p.stdout)
 
 
 def main():
     args = parse_arguments()
 
-- 
2.18.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
