Received: from zproxy.gmail.com ([64.233.162.197])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ETC1d-0000rS-NJ
	for linux-mtd@lists.infradead.org; Sat, 22 Oct 2005 01:35:35 -0400
Received: by zproxy.gmail.com with SMTP id s18so549633nze
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Oct 2005 22:34:33 -0700 (PDT)
Date: Sat, 22 Oct 2005 14:34:25 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <b1c6420f0510142013u634116eag4f360a6a2e7f8432@mail.gmail.com>
References: <b1c6420f0510142013u634116eag4f360a6a2e7f8432@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID: <4359cf69.67e8a797.2ae9.ffffa9e5@mx.gmail.com>
Subject: Re: [PATCH 4/4] util/jffs2reader better output formats
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 15 Oct 2005 12:13:46 +0900, I wrote:
> This is the 4th patch for util/jffs2reader.c.
> It is not a bug fix and makes some improvements.
> 
> Please review and apply if it is ok.

The patch without quoted-printable encoding and extra linebreaks.
Thanks.


--- jffs2reader.c.catfile	2005-10-10 18:22:02.000000000 +0900
+++ jffs2reader.c	2005-10-10 19:31:21.000000000 +0900
@@ -320,6 +320,7 @@ void printdir(char *o, size_t size, stru
 	char *filetime;
 	time_t age;
 	struct jffs2_raw_inode *ri;
+	struct dir *od = d;
 
 	if (!path)
 		return;
@@ -369,7 +370,7 @@ void printdir(char *o, size_t size, stru
 		age = je32_to_cpu (ri->ctime);
 		filetime = ctime(&age);
 		age = time(NULL) - je32_to_cpu (ri->ctime);
-		printf("%s %-4d %-8d %-8d ", mode_string(jemode_to_cpu (ri->mode)),
+		printf("%s %-4d %-5d %-5d ", mode_string(jemode_to_cpu (ri->mode)),
 			   1, je16_to_cpu (ri->uid), je16_to_cpu (ri->gid));
 		if ( d->type==DT_BLK || d->type==DT_CHR ) {
 			dev_t rdev;
@@ -382,9 +383,14 @@ void printdir(char *o, size_t size, stru
 		d->name[d->nsize]='\0';
 		if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
 			/* hh:mm if less than 6 months old */
-			printf("%6.6s %5.5s %s/%s%c", filetime + 4, filetime + 11, path, d->name, m);
+			printf("%6.6s %5.5s ", filetime + 4, filetime + 11);
 		} else {
-			printf("%6.6s %4.4s %s/%s%c", filetime + 4, filetime + 20, path, d->name, m);
+			printf("%6.6s  %4.4s ", filetime + 4, filetime + 20);
+		}
+		if (*path == '\0') {
+			printf ("%s%c", d->name, m);
+		} else {
+			printf ("%s/%s%c", path, d->name, m);
 		}
 		if (d->type == DT_LNK) {
 			char symbuf[1024];
@@ -395,19 +401,32 @@ void printdir(char *o, size_t size, stru
 		}
 		printf("\n");
 
-		if (d->type == DT_DIR && recurse) {
-			char *tmp;
-			tmp = malloc(BUFSIZ);
-			if (!tmp) {
-				fprintf(stderr, "memory exhausted\n");
-				exit(EXIT_FAILURE);
+		d = d->next;
+	}
+
+	if (recurse) {
+		d = od;
+		while (d != NULL) {
+			if (d->type == DT_DIR) {
+				char *tmp;
+				tmp = malloc(BUFSIZ);
+				if (!tmp) {
+					fprintf(stderr, "memory exhausted\n");
+					exit(EXIT_FAILURE);
+				}
+				printf ("\n");
+				if (*path == '\0') {
+					strcpy (tmp, d->name);
+				} else {
+					sprintf(tmp, "%s/%s", path, d->name);
+				}
+				printf("%s/\n", tmp);
+				lsdir(o, size, tmp, recurse);		/* Go recursive */
+				free(tmp);
 			}
-			sprintf(tmp, "%s/%s", path, d->name);
-			lsdir(o, size, tmp, recurse);		/* Go recursive */
-			free(tmp);
-		}
 
-		d = d->next;
+			d = d->next;
+		}
 	}
 }
 
@@ -1032,7 +1051,7 @@ int main(int argc, char **argv)
 	}
 
 	if (!dir && !file)
-		lsdir(buf, st.st_size, "/", 1);
+		lsdir(buf, st.st_size, "", recurse);
 
 
 	free(buf);


-- 
Suzuki Takashi
