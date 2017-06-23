Received: from ms.lwn.net ([45.79.88.28])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOVAp-0002IZ-7w
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 20:27:24 +0000
Date: Fri, 23 Jun 2017 14:26:54 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Markus Heiser <markus.heiser@darmarit.de>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>, Jani Nikula
 <jani.nikula@intel.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>,
 "linux-kernel@vger.kernel.org org List" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 00/53] Get rid of Docbook
Message-ID: <20170623142654.128ac5e3@lwn.net>
In-Reply-To: <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <20170518112608.4f355068@lwn.net>
 <20170518200140.11982b12@vento.lan>
 <C33A12EC-8748-4BB9-A7A2-023B1901AB4B@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 Jun 2017 16:03:23 +0200
Markus Heiser <markus.heiser@darmarit.de> wrote:

> I guess there are little remains lying around ;) what I have found:

I just committed the following to clean up that stuff, thanks.

jon

=46rom 52b3f239bb692d9b3a68461798fb15c011e4108e Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Fri, 23 Jun 2017 14:17:38 -0600
Subject: [PATCH] Docs: clean up some DocBook loose ends

There were a few bits and pieces left over from the now-disused DocBook
toolchain; git rid of them.

Reported-by: Markus Heiser <markus.heiser@darmarit.de>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/dontdiff                    |   1 -
 Documentation/sphinx/convert_template.sed |  18 -
 Documentation/sphinx/post_convert.sed     |  23 -
 MAINTAINERS                               |   3 +-
 Makefile                                  |   1 -
 scripts/.gitignore                        |   1 -
 scripts/Makefile                          |   7 +-
 scripts/docproc.c                         | 681 --------------------------=
----
 scripts/kernel-doc-xml-ref                | 198 ---------
 9 files changed, 3 insertions(+), 930 deletions(-)
 delete mode 100644 Documentation/sphinx/convert_template.sed
 delete mode 100644 Documentation/sphinx/post_convert.sed
 delete mode 100644 scripts/docproc.c
 delete mode 100755 scripts/kernel-doc-xml-ref

diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 77b92221f951..f64a63b233c3 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -118,7 +118,6 @@ defkeymap.c
 devlist.h*
 devicetable-offsets.h
 dnotify_test
-docproc
 dslm
 dtc
 elf2ecoff
diff --git a/Documentation/sphinx/convert_template.sed b/Documentation/sphi=
nx/convert_template.sed
deleted file mode 100644
index c1503fcca4ec..000000000000
--- a/Documentation/sphinx/convert_template.sed
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Pandoc doesn't grok <function> or <structname>, so convert them
-# ahead of time.
-#
-# Use the following escapes to pass through pandoc:
-#	$bq =3D "`"
-#	$lt =3D "<"
-#	$gt =3D ">"
-#
-s%<function>\([^<(]\+\)()</function>%:c:func:$bq\1()$bq%g
-s%<function>\([^<(]\+\)</function>%:c:func:$bq\1()$bq%g
-s%<structname>struct *\([^<]\+\)</structname>%:c:type:$bqstruct \1 $lt\1$g=
t$bq%g
-s%struct <structname>\([^<]\+\)</structname>%:c:type:$bqstruct \1 $lt\1$gt=
$bq%g
-s%<structname>\([^<]\+\)</structname>%:c:type:$bqstruct \1 $lt\1$gt$bq%g
-#
-# Wrap docproc directives in para and code blocks.
-#
-s%^\(!.*\)$%<para><code>DOCPROC: \1</code></para>%
diff --git a/Documentation/sphinx/post_convert.sed b/Documentation/sphinx/p=
ost_convert.sed
deleted file mode 100644
index 392770bac53b..000000000000
--- a/Documentation/sphinx/post_convert.sed
+++ /dev/null
@@ -1,23 +0,0 @@
-#
-# Unescape.
-#
-s/$bq/`/g
-s/$lt/</g
-s/$gt/>/g
-#
-# pandoc thinks that both "_" needs to be escaped.  Remove the extra
-# backslashes.
-#
-s/\\_/_/g
-#
-# Unwrap docproc directives.
-#
-s/^``DOCPROC: !E\(.*\)``$/.. kernel-doc:: \1\n   :export:/
-s/^``DOCPROC: !I\(.*\)``$/.. kernel-doc:: \1\n   :internal:/
-s/^``DOCPROC: !F\([^ ]*\) \(.*\)``$/.. kernel-doc:: \1\n   :functions: \2/
-s/^``DOCPROC: !P\([^ ]*\) \(.*\)``$/.. kernel-doc:: \1\n   :doc: \2/
-s/^``DOCPROC: \(!.*\)``$/.. WARNING: DOCPROC directive not supported: \1/
-#
-# Trim trailing whitespace.
-#
-s/[[:space:]]*$//
diff --git a/MAINTAINERS b/MAINTAINERS
index 5df61e9757dc..12110616b2d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4135,8 +4135,7 @@ M:	Jonathan Corbet <corbet@lwn.net>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/
-F:	scripts/docproc.c
-F:	scripts/kernel-doc*
+F:	scripts/kernel-doc
 X:	Documentation/ABI/
 X:	Documentation/devicetree/
 X:	Documentation/acpi
diff --git a/Makefile b/Makefile
index 855a48c41d61..dd1eb8d6c232 100644
--- a/Makefile
+++ b/Makefile
@@ -1467,7 +1467,6 @@ $(help-board-dirs): help-%:
 DOC_TARGETS :=3D xmldocs sgmldocs psdocs latexdocs pdfdocs htmldocs mandoc=
s installmandocs epubdocs cleandocs linkcheckdocs
 PHONY +=3D $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
-	$(Q)$(MAKE) $(build)=3Dscripts build_docproc
 	$(Q)$(MAKE) $(build)=3DDocumentation $@
=20
 else # KBUILD_EXTMOD
diff --git a/scripts/.gitignore b/scripts/.gitignore
index e063daa3ec4a..0442c06eefcb 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -7,7 +7,6 @@ pnmtologo
 unifdef
 ihex2fw
 recordmcount
-docproc
 check-lc_ctype
 sortextable
 asn1_compiler
diff --git a/scripts/Makefile b/scripts/Makefile
index 55550e4141c4..c06f4997d700 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -6,7 +6,6 @@
 # pnmttologo:    Convert pnm files to logo files
 # conmakehash:   Create chartable
 # conmakehash:	 Create arrays for initializing the kernel console tables
-# docproc:       Used in Documentation/
=20
 HOST_EXTRACFLAGS +=3D -I$(srctree)/tools/include
=20
@@ -28,14 +27,12 @@ HOSTLOADLIBES_extract-cert =3D -lcrypto
 always		:=3D $(hostprogs-y) $(hostprogs-m)
=20
 # The following hostprogs-y programs are only build on demand
-hostprogs-y +=3D unifdef docproc
+hostprogs-y +=3D unifdef
=20
 # These targets are used internally to avoid "is up to date" messages
-PHONY +=3D build_unifdef build_docproc
+PHONY +=3D build_unifdef
 build_unifdef: $(obj)/unifdef
 	@:
-build_docproc: $(obj)/docproc
-	@:
=20
 subdir-$(CONFIG_MODVERSIONS) +=3D genksyms
 subdir-y                     +=3D mod
diff --git a/scripts/docproc.c b/scripts/docproc.c
deleted file mode 100644
index 0a12593b9041..000000000000
--- a/scripts/docproc.c
+++ /dev/null
@@ -1,681 +0,0 @@
-/*
- *	docproc is a simple preprocessor for the template files
- *      used as placeholders for the kernel internal documentation.
- *	docproc is used for documentation-frontend and
- *      dependency-generator.
- *	The two usages have in common that they require
- *	some knowledge of the .tmpl syntax, therefore they
- *	are kept together.
- *
- *	documentation-frontend
- *		Scans the template file and call kernel-doc for
- *		all occurrences of ![EIF]file
- *		Beforehand each referenced file is scanned for
- *		any symbols that are exported via these macros:
- *			EXPORT_SYMBOL(), EXPORT_SYMBOL_GPL(), &
- *			EXPORT_SYMBOL_GPL_FUTURE()
- *		This is used to create proper -function and
- *		-nofunction arguments in calls to kernel-doc.
- *		Usage: docproc doc file.tmpl
- *
- *	dependency-generator:
- *		Scans the template file and list all files
- *		referenced in a format recognized by make.
- *		Usage:	docproc depend file.tmpl
- *		Writes dependency information to stdout
- *		in the following format:
- *		file.tmpl src.c	src2.c
- *		The filenames are obtained from the following constructs:
- *		!Efilename
- *		!Ifilename
- *		!Dfilename
- *		!Ffilename
- *		!Pfilename
- *
- */
-
-#define _GNU_SOURCE
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <ctype.h>
-#include <unistd.h>
-#include <limits.h>
-#include <errno.h>
-#include <getopt.h>
-#include <sys/types.h>
-#include <sys/wait.h>
-#include <time.h>
-
-/* exitstatus is used to keep track of any failing calls to kernel-doc,
- * but execution continues. */
-int exitstatus =3D 0;
-
-typedef void DFL(char *);
-DFL *defaultline;
-
-typedef void FILEONLY(char * file);
-FILEONLY *internalfunctions;
-FILEONLY *externalfunctions;
-FILEONLY *symbolsonly;
-FILEONLY *findall;
-
-typedef void FILELINE(char * file, char * line);
-FILELINE * singlefunctions;
-FILELINE * entity_system;
-FILELINE * docsection;
-
-#define MAXLINESZ     2048
-#define MAXFILES      250
-#define KERNELDOCPATH "scripts/"
-#define KERNELDOC     "kernel-doc"
-#define DOCBOOK       "-docbook"
-#define RST           "-rst"
-#define LIST          "-list"
-#define FUNCTION      "-function"
-#define NOFUNCTION    "-nofunction"
-#define NODOCSECTIONS "-no-doc-sections"
-#define SHOWNOTFOUND  "-show-not-found"
-
-enum file_format {
-	FORMAT_AUTO,
-	FORMAT_DOCBOOK,
-	FORMAT_RST,
-};
-
-static enum file_format file_format =3D FORMAT_AUTO;
-
-#define KERNELDOC_FORMAT	(file_format =3D=3D FORMAT_RST ? RST : DOCBOOK)
-
-static char *srctree, *kernsrctree;
-
-static char **all_list =3D NULL;
-static int all_list_len =3D 0;
-
-static void consume_symbol(const char *sym)
-{
-	int i;
-
-	for (i =3D 0; i < all_list_len; i++) {
-		if (!all_list[i])
-			continue;
-		if (strcmp(sym, all_list[i]))
-			continue;
-		all_list[i] =3D NULL;
-		break;
-	}
-}
-
-static void usage (void)
-{
-	fprintf(stderr, "Usage: docproc [{--docbook|--rst}] {doc|depend} file\n");
-	fprintf(stderr, "Input is read from file.tmpl. Output is sent to stdout\n=
");
-	fprintf(stderr, "doc: frontend when generating kernel documentation\n");
-	fprintf(stderr, "depend: generate list of files referenced within file\n"=
);
-	fprintf(stderr, "Environment variable SRCTREE: absolute path to sources.\=
n");
-	fprintf(stderr, "                     KBUILD_SRC: absolute path to kernel=
 source tree.\n");
-}
-
-/*
- * Execute kernel-doc with parameters given in svec
- */
-static void exec_kernel_doc(char **svec)
-{
-	pid_t pid;
-	int ret;
-	char real_filename[PATH_MAX + 1];
-	/* Make sure output generated so far are flushed */
-	fflush(stdout);
-	switch (pid=3Dfork()) {
-		case -1:
-			perror("fork");
-			exit(1);
-		case  0:
-			memset(real_filename, 0, sizeof(real_filename));
-			strncat(real_filename, kernsrctree, PATH_MAX);
-			strncat(real_filename, "/" KERNELDOCPATH KERNELDOC,
-					PATH_MAX - strlen(real_filename));
-			execvp(real_filename, svec);
-			fprintf(stderr, "exec ");
-			perror(real_filename);
-			exit(1);
-		default:
-			waitpid(pid, &ret ,0);
-	}
-	if (WIFEXITED(ret))
-		exitstatus |=3D WEXITSTATUS(ret);
-	else
-		exitstatus =3D 0xff;
-}
-
-/* Types used to create list of all exported symbols in a number of files =
*/
-struct symbols
-{
-	char *name;
-};
-
-struct symfile
-{
-	char *filename;
-	struct symbols *symbollist;
-	int symbolcnt;
-};
-
-struct symfile symfilelist[MAXFILES];
-int symfilecnt =3D 0;
-
-static void add_new_symbol(struct symfile *sym, char * symname)
-{
-	sym->symbollist =3D
-	  realloc(sym->symbollist, (sym->symbolcnt + 1) * sizeof(char *));
-	sym->symbollist[sym->symbolcnt++].name =3D strdup(symname);
-}
-
-/* Add a filename to the list */
-static struct symfile * add_new_file(char * filename)
-{
-	symfilelist[symfilecnt++].filename =3D strdup(filename);
-	return &symfilelist[symfilecnt - 1];
-}
-
-/* Check if file already are present in the list */
-static struct symfile * filename_exist(char * filename)
-{
-	int i;
-	for (i=3D0; i < symfilecnt; i++)
-		if (strcmp(symfilelist[i].filename, filename) =3D=3D 0)
-			return &symfilelist[i];
-	return NULL;
-}
-
-/*
- * List all files referenced within the template file.
- * Files are separated by tabs.
- */
-static void adddep(char * file)		   { printf("\t%s", file); }
-static void adddep2(char * file, char * line)     { line =3D line; adddep(=
file); }
-static void noaction(char * line)		   { line =3D line; }
-static void noaction2(char * file, char * line)   { file =3D file; line =
=3D line; }
-
-/* Echo the line without further action */
-static void printline(char * line)               { printf("%s", line); }
-
-/*
- * Find all symbols in filename that are exported with EXPORT_SYMBOL &
- * EXPORT_SYMBOL_GPL (& EXPORT_SYMBOL_GPL_FUTURE implicitly).
- * All symbols located are stored in symfilelist.
- */
-static void find_export_symbols(char * filename)
-{
-	FILE * fp;
-	struct symfile *sym;
-	char line[MAXLINESZ];
-	if (filename_exist(filename) =3D=3D NULL) {
-		char real_filename[PATH_MAX + 1];
-		memset(real_filename, 0, sizeof(real_filename));
-		strncat(real_filename, srctree, PATH_MAX);
-		strncat(real_filename, "/", PATH_MAX - strlen(real_filename));
-		strncat(real_filename, filename,
-				PATH_MAX - strlen(real_filename));
-		sym =3D add_new_file(filename);
-		fp =3D fopen(real_filename, "r");
-		if (fp =3D=3D NULL)	{
-			fprintf(stderr, "docproc: ");
-			perror(real_filename);
-			exit(1);
-		}
-		while (fgets(line, MAXLINESZ, fp)) {
-			char *p;
-			char *e;
-			if (((p =3D strstr(line, "EXPORT_SYMBOL_GPL")) !=3D NULL) ||
-			    ((p =3D strstr(line, "EXPORT_SYMBOL")) !=3D NULL)) {
-				/* Skip EXPORT_SYMBOL{_GPL} */
-				while (isalnum(*p) || *p =3D=3D '_')
-					p++;
-				/* Remove parentheses & additional whitespace */
-				while (isspace(*p))
-					p++;
-				if (*p !=3D '(')
-					continue; /* Syntax error? */
-				else
-					p++;
-				while (isspace(*p))
-					p++;
-				e =3D p;
-				while (isalnum(*e) || *e =3D=3D '_')
-					e++;
-				*e =3D '\0';
-				add_new_symbol(sym, p);
-			}
-		}
-		fclose(fp);
-	}
-}
-
-/*
- * Document all external or internal functions in a file.
- * Call kernel-doc with following parameters:
- * kernel-doc [-docbook|-rst] -nofunction function_name1 filename
- * Function names are obtained from all the src files
- * by find_export_symbols.
- * intfunc uses -nofunction
- * extfunc uses -function
- */
-static void docfunctions(char * filename, char * type)
-{
-	int i,j;
-	int symcnt =3D 0;
-	int idx =3D 0;
-	char **vec;
-
-	for (i=3D0; i <=3D symfilecnt; i++)
-		symcnt +=3D symfilelist[i].symbolcnt;
-	vec =3D malloc((2 + 2 * symcnt + 3) * sizeof(char *));
-	if (vec =3D=3D NULL) {
-		perror("docproc: ");
-		exit(1);
-	}
-	vec[idx++] =3D KERNELDOC;
-	vec[idx++] =3D KERNELDOC_FORMAT;
-	vec[idx++] =3D NODOCSECTIONS;
-	for (i=3D0; i < symfilecnt; i++) {
-		struct symfile * sym =3D &symfilelist[i];
-		for (j=3D0; j < sym->symbolcnt; j++) {
-			vec[idx++]     =3D type;
-			consume_symbol(sym->symbollist[j].name);
-			vec[idx++] =3D sym->symbollist[j].name;
-		}
-	}
-	vec[idx++]     =3D filename;
-	vec[idx] =3D NULL;
-	if (file_format =3D=3D FORMAT_RST)
-		printf(".. %s\n", filename);
-	else
-		printf("<!-- %s -->\n", filename);
-	exec_kernel_doc(vec);
-	fflush(stdout);
-	free(vec);
-}
-static void intfunc(char * filename) {	docfunctions(filename, NOFUNCTION);=
 }
-static void extfunc(char * filename) { docfunctions(filename, FUNCTION);  =
 }
-
-/*
- * Document specific function(s) in a file.
- * Call kernel-doc with the following parameters:
- * kernel-doc -docbook -function function1 [-function function2]
- */
-static void singfunc(char * filename, char * line)
-{
-	char *vec[200]; /* Enough for specific functions */
-	int i, idx =3D 0;
-	int startofsym =3D 1;
-	vec[idx++] =3D KERNELDOC;
-	vec[idx++] =3D KERNELDOC_FORMAT;
-	vec[idx++] =3D SHOWNOTFOUND;
-
-	/* Split line up in individual parameters preceded by FUNCTION */
-	for (i=3D0; line[i]; i++) {
-		if (isspace(line[i])) {
-			line[i] =3D '\0';
-			startofsym =3D 1;
-			continue;
-		}
-		if (startofsym) {
-			startofsym =3D 0;
-			vec[idx++] =3D FUNCTION;
-			vec[idx++] =3D &line[i];
-		}
-	}
-	for (i =3D 0; i < idx; i++) {
-		if (strcmp(vec[i], FUNCTION))
-			continue;
-		consume_symbol(vec[i + 1]);
-	}
-	vec[idx++] =3D filename;
-	vec[idx] =3D NULL;
-	exec_kernel_doc(vec);
-}
-
-/*
- * Insert specific documentation section from a file.
- * Call kernel-doc with the following parameters:
- * kernel-doc -docbook -function "doc section" filename
- */
-static void docsect(char *filename, char *line)
-{
-	/* kerneldoc -docbook -show-not-found -function "section" file NULL */
-	char *vec[7];
-	char *s;
-
-	for (s =3D line; *s; s++)
-		if (*s =3D=3D '\n')
-			*s =3D '\0';
-
-	if (asprintf(&s, "DOC: %s", line) < 0) {
-		perror("asprintf");
-		exit(1);
-	}
-	consume_symbol(s);
-	free(s);
-
-	vec[0] =3D KERNELDOC;
-	vec[1] =3D KERNELDOC_FORMAT;
-	vec[2] =3D SHOWNOTFOUND;
-	vec[3] =3D FUNCTION;
-	vec[4] =3D line;
-	vec[5] =3D filename;
-	vec[6] =3D NULL;
-	exec_kernel_doc(vec);
-}
-
-static void find_all_symbols(char *filename)
-{
-	char *vec[4]; /* kerneldoc -list file NULL */
-	pid_t pid;
-	int ret, i, count, start;
-	char real_filename[PATH_MAX + 1];
-	int pipefd[2];
-	char *data, *str;
-	size_t data_len =3D 0;
-
-	vec[0] =3D KERNELDOC;
-	vec[1] =3D LIST;
-	vec[2] =3D filename;
-	vec[3] =3D NULL;
-
-	if (pipe(pipefd)) {
-		perror("pipe");
-		exit(1);
-	}
-
-	switch (pid=3Dfork()) {
-		case -1:
-			perror("fork");
-			exit(1);
-		case  0:
-			close(pipefd[0]);
-			dup2(pipefd[1], 1);
-			memset(real_filename, 0, sizeof(real_filename));
-			strncat(real_filename, kernsrctree, PATH_MAX);
-			strncat(real_filename, "/" KERNELDOCPATH KERNELDOC,
-					PATH_MAX - strlen(real_filename));
-			execvp(real_filename, vec);
-			fprintf(stderr, "exec ");
-			perror(real_filename);
-			exit(1);
-		default:
-			close(pipefd[1]);
-			data =3D malloc(4096);
-			do {
-				while ((ret =3D read(pipefd[0],
-						   data + data_len,
-						   4096)) > 0) {
-					data_len +=3D ret;
-					data =3D realloc(data, data_len + 4096);
-				}
-			} while (ret =3D=3D -EAGAIN);
-			if (ret !=3D 0) {
-				perror("read");
-				exit(1);
-			}
-			waitpid(pid, &ret ,0);
-	}
-	if (WIFEXITED(ret))
-		exitstatus |=3D WEXITSTATUS(ret);
-	else
-		exitstatus =3D 0xff;
-
-	count =3D 0;
-	/* poor man's strtok, but with counting */
-	for (i =3D 0; i < data_len; i++) {
-		if (data[i] =3D=3D '\n') {
-			count++;
-			data[i] =3D '\0';
-		}
-	}
-	start =3D all_list_len;
-	all_list_len +=3D count;
-	all_list =3D realloc(all_list, sizeof(char *) * all_list_len);
-	str =3D data;
-	for (i =3D 0; i < data_len && start !=3D all_list_len; i++) {
-		if (data[i] =3D=3D '\0') {
-			all_list[start] =3D str;
-			str =3D data + i + 1;
-			start++;
-		}
-	}
-}
-
-/*
- * Terminate s at first space, if any. If there was a space, return pointe=
r to
- * the character after that. Otherwise, return pointer to the terminating =
NUL.
- */
-static char *chomp(char *s)
-{
-	while (*s && !isspace(*s))
-		s++;
-
-	if (*s)
-		*s++ =3D '\0';
-
-	return s;
-}
-
-/* Return pointer to directive content, or NULL if not a directive. */
-static char *is_directive(char *line)
-{
-	if (file_format =3D=3D FORMAT_DOCBOOK && line[0] =3D=3D '!')
-		return line + 1;
-	else if (file_format =3D=3D FORMAT_RST && !strncmp(line, ".. !", 4))
-		return line + 4;
-
-	return NULL;
-}
-
-/*
- * Parse file, calling action specific functions for:
- * 1) Lines containing !E
- * 2) Lines containing !I
- * 3) Lines containing !D
- * 4) Lines containing !F
- * 5) Lines containing !P
- * 6) Lines containing !C
- * 7) Default lines - lines not matching the above
- */
-static void parse_file(FILE *infile)
-{
-	char line[MAXLINESZ];
-	char *p, *s;
-	while (fgets(line, MAXLINESZ, infile)) {
-		p =3D is_directive(line);
-		if (!p) {
-			defaultline(line);
-			continue;
-		}
-
-		switch (*p++) {
-		case 'E':
-			chomp(p);
-			externalfunctions(p);
-			break;
-		case 'I':
-			chomp(p);
-			internalfunctions(p);
-			break;
-		case 'D':
-			chomp(p);
-			symbolsonly(p);
-			break;
-		case 'F':
-			/* filename */
-			s =3D chomp(p);
-			/* function names */
-			while (isspace(*s))
-				s++;
-			singlefunctions(p, s);
-			break;
-		case 'P':
-			/* filename */
-			s =3D chomp(p);
-			/* DOC: section name */
-			while (isspace(*s))
-				s++;
-			docsection(p, s);
-			break;
-		case 'C':
-			chomp(p);
-			if (findall)
-				findall(p);
-			break;
-		default:
-			defaultline(line);
-		}
-	}
-	fflush(stdout);
-}
-
-/*
- * Is this a RestructuredText template?  Answer the question by seeing if =
its
- * name ends in ".rst".
- */
-static int is_rst(const char *file)
-{
-	char *dot =3D strrchr(file, '.');
-
-	return dot && !strcmp(dot + 1, "rst");
-}
-
-enum opts {
-	OPT_DOCBOOK,
-	OPT_RST,
-	OPT_HELP,
-};
-
-int main(int argc, char *argv[])
-{
-	const char *subcommand, *filename;
-	FILE * infile;
-	int i;
-
-	srctree =3D getenv("SRCTREE");
-	if (!srctree)
-		srctree =3D getcwd(NULL, 0);
-	kernsrctree =3D getenv("KBUILD_SRC");
-	if (!kernsrctree || !*kernsrctree)
-		kernsrctree =3D srctree;
-
-	for (;;) {
-		int c;
-		struct option opts[] =3D {
-			{ "docbook",	no_argument, NULL, OPT_DOCBOOK },
-			{ "rst",	no_argument, NULL, OPT_RST },
-			{ "help",	no_argument, NULL, OPT_HELP },
-			{}
-		};
-
-		c =3D getopt_long_only(argc, argv, "", opts, NULL);
-		if (c =3D=3D -1)
-			break;
-
-		switch (c) {
-		case OPT_DOCBOOK:
-			file_format =3D FORMAT_DOCBOOK;
-			break;
-		case OPT_RST:
-			file_format =3D FORMAT_RST;
-			break;
-		case OPT_HELP:
-			usage();
-			return 0;
-		default:
-		case '?':
-			usage();
-			return 1;
-		}
-	}
-
-	argc -=3D optind;
-	argv +=3D optind;
-
-	if (argc !=3D 2) {
-		usage();
-		exit(1);
-	}
-
-	subcommand =3D argv[0];
-	filename =3D argv[1];
-
-	if (file_format =3D=3D FORMAT_AUTO)
-		file_format =3D is_rst(filename) ? FORMAT_RST : FORMAT_DOCBOOK;
-
-	/* Open file, exit on error */
-	infile =3D fopen(filename, "r");
-	if (infile =3D=3D NULL) {
-		fprintf(stderr, "docproc: ");
-		perror(filename);
-		exit(2);
-	}
-
-	if (strcmp("doc", subcommand) =3D=3D 0) {
-		if (file_format =3D=3D FORMAT_RST) {
-			time_t t =3D time(NULL);
-			printf(".. generated from %s by docproc %s\n",
-			       filename, ctime(&t));
-		}
-
-		/* Need to do this in two passes.
-		 * First pass is used to collect all symbols exported
-		 * in the various files;
-		 * Second pass generate the documentation.
-		 * This is required because some functions are declared
-		 * and exported in different files :-((
-		 */
-		/* Collect symbols */
-		defaultline       =3D noaction;
-		internalfunctions =3D find_export_symbols;
-		externalfunctions =3D find_export_symbols;
-		symbolsonly       =3D find_export_symbols;
-		singlefunctions   =3D noaction2;
-		docsection        =3D noaction2;
-		findall           =3D find_all_symbols;
-		parse_file(infile);
-
-		/* Rewind to start from beginning of file again */
-		fseek(infile, 0, SEEK_SET);
-		defaultline       =3D printline;
-		internalfunctions =3D intfunc;
-		externalfunctions =3D extfunc;
-		symbolsonly       =3D printline;
-		singlefunctions   =3D singfunc;
-		docsection        =3D docsect;
-		findall           =3D NULL;
-
-		parse_file(infile);
-
-		for (i =3D 0; i < all_list_len; i++) {
-			if (!all_list[i])
-				continue;
-			fprintf(stderr, "Warning: didn't use docs for %s\n",
-				all_list[i]);
-		}
-	} else if (strcmp("depend", subcommand) =3D=3D 0) {
-		/* Create first part of dependency chain
-		 * file.tmpl */
-		printf("%s\t", filename);
-		defaultline       =3D noaction;
-		internalfunctions =3D adddep;
-		externalfunctions =3D adddep;
-		symbolsonly       =3D adddep;
-		singlefunctions   =3D adddep2;
-		docsection        =3D adddep2;
-		findall           =3D adddep;
-		parse_file(infile);
-		printf("\n");
-	} else {
-		fprintf(stderr, "Unknown option: %s\n", subcommand);
-		exit(1);
-	}
-	fclose(infile);
-	fflush(stdout);
-	return exitstatus;
-}
diff --git a/scripts/kernel-doc-xml-ref b/scripts/kernel-doc-xml-ref
deleted file mode 100755
index 104a5a5ba2c8..000000000000
--- a/scripts/kernel-doc-xml-ref
+++ /dev/null
@@ -1,198 +0,0 @@
-#!/usr/bin/perl -w
-
-use strict;
-
-## Copyright (C) 2015  Intel Corporation                         ##
-#                                                                ##
-## This software falls under the GNU General Public License.     ##
-## Please read the COPYING file for more information             ##
-#
-#
-# This software reads a XML file and a list of valid interal
-# references to replace Docbook tags with links.
-#
-# The list of "valid internal references" must be one-per-line in the foll=
owing format:
-#      API-struct-foo
-#      API-enum-bar
-#      API-my-function
-#
-# The software walks over the XML file looking for xml tags representing p=
ossible references
-# to the Document. Each reference will be cross checked against the "Valid=
 Internal Reference" list. If
-# the referece is found it replaces its content by a <link> tag.
-#
-# usage:
-# kernel-doc-xml-ref -db filename
-#		     xml filename > outputfile
-
-# read arguments
-if ($#ARGV !=3D 2) {
-	usage();
-}
-
-#Holds the database filename
-my $databasefile;
-my @database;
-
-#holds the inputfile
-my $inputfile;
-my $errors =3D 0;
-
-my %highlights =3D (
-	"<function>(.*?)</function>",
-	    "\"<function>\" . convert_function(\$1, \$line) . \"</function>\"",
-	"<structname>(.*?)</structname>",
-	    "\"<structname>\" . convert_struct(\$1) . \"</structname>\"",
-	"<funcdef>(.*?)<function>(.*?)</function></funcdef>",
-	    "\"<funcdef>\" . convert_param(\$1) . \"<function>\$2</function></fun=
cdef>\"",
-	"<paramdef>(.*?)<parameter>(.*?)</parameter></paramdef>",
-	    "\"<paramdef>\" . convert_param(\$1) . \"<parameter>\$2</parameter></=
paramdef>\"");
-
-while($ARGV[0] =3D~ m/^-(.*)/) {
-	my $cmd =3D shift @ARGV;
-	if ($cmd eq "-db") {
-		$databasefile =3D shift @ARGV
-	} else {
-		usage();
-	}
-}
-$inputfile =3D shift @ARGV;
-
-sub open_database {
-	open (my $handle, '<', $databasefile) or die "Cannot open $databasefile";
-	chomp(my @lines =3D <$handle>);
-	close $handle;
-
-	@database =3D @lines;
-}
-
-sub process_file {
-	open_database();
-
-	my $dohighlight;
-	foreach my $pattern (keys %highlights) {
-		$dohighlight .=3D  "\$line =3D~ s:$pattern:$highlights{$pattern}:eg;\n";
-	}
-
-	open(FILE, $inputfile) or die("Could not open $inputfile") or die ("Canno=
t open $inputfile");
-	foreach my $line (<FILE>)  {
-		eval $dohighlight;
-		print $line;
-	}
-}
-
-sub trim($_)
-{
-	my $str =3D $_[0];
-	$str =3D~ s/^\s+|\s+$//g;
-	return $str
-}
-
-sub has_key_defined($_)
-{
-	if ( grep( /^$_[0]$/, @database)) {
-		return 1;
-	}
-	return 0;
-}
-
-# Gets a <function> content and add it a hyperlink if possible.
-sub convert_function($_)
-{
-	my $arg =3D $_[0];
-	my $key =3D $_[0];
-
-	my $line =3D $_[1];
-
-	$key =3D trim($key);
-
-	$key =3D~ s/[^A-Za-z0-9]/-/g;
-	$key =3D "API-" . $key;
-
-	# We shouldn't add links to <funcdef> prototype
-	if (!has_key_defined($key) || $line =3D~ m/\s+<funcdef/i) {
-		return $arg;
-	}
-
-	my $head =3D $arg;
-	my $tail =3D "";
-	if ($arg =3D~ /(.*?)( ?)$/) {
-		$head =3D $1;
-		$tail =3D $2;
-	}
-	return "<link linkend=3D\"$key\">$head</link>$tail";
-}
-
-# Converting a struct text to link
-sub convert_struct($_)
-{
-	my $arg =3D $_[0];
-	my $key =3D $_[0];
-	$key =3D~ s/(struct )?(\w)/$2/g;
-	$key =3D~ s/[^A-Za-z0-9]/-/g;
-	$key =3D "API-struct-" . $key;
-
-	if (!has_key_defined($key)) {
-		return $arg;
-	}
-
-	my ($head, $tail) =3D split_pointer($arg);
-	return "<link linkend=3D\"$key\">$head</link>$tail";
-}
-
-# Identify "object *" elements
-sub split_pointer($_)
-{
-	my $arg =3D $_[0];
-	if ($arg =3D~ /(.*?)( ?\* ?)/) {
-		return ($1, $2);
-	}
-	return ($arg, "");
-}
-
-sub convert_param($_)
-{
-	my $type =3D $_[0];
-	my $keyname =3D convert_key_name($type);
-
-	if (!has_key_defined($keyname)) {
-		return $type;
-	}
-
-	my ($head, $tail) =3D split_pointer($type);
-	return "<link linkend=3D\"$keyname\">$head</link>$tail";
-
-}
-
-# DocBook links are in the API-<TYPE>-<STRUCT-NAME> format
-# This method gets an element and returns a valid DocBook reference for it.
-sub convert_key_name($_)
-{
-	#Pattern $2 is optional and might be uninitialized
-	no warnings 'uninitialized';
-
-	my $str =3D $_[0];
-	$str =3D~ s/(const|static)? ?(struct)? ?([a-zA-Z0-9_]+) ?(\*|&)?/$2 $3/g ;
-
-	# trim
-	$str =3D~ s/^\s+|\s+$//g;
-
-	# spaces and _ to -
-	$str =3D~ s/[^A-Za-z0-9]/-/g;
-
-	return "API-" . $str;
-}
-
-sub usage {
-	print "Usage: $0 -db database filename\n";
-	print "         xml source file(s) > outputfile\n";
-	exit 1;
-}
-
-# starting point
-process_file();
-
-if ($errors) {
-	print STDERR "$errors errors\n";
-}
-
-exit($errors);
--=20
2.13.1
