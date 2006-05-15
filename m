Received: from web37902.mail.mud.yahoo.com ([209.191.124.97])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ffeu6-0003Nm-Gh
	for linux-mtd@lists.infradead.org; Mon, 15 May 2006 11:22:43 -0400
Message-ID: <20060515151556.21775.qmail@web37902.mail.mud.yahoo.com>
Date: Mon, 15 May 2006 08:15:56 -0700 (PDT)
From: syed khader <khader_s_s@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: CRC errors when continuous fseek/fputs on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   I am finding this strange problem.
I am running the following piece of code :

int main()
{
   FILE *fp;
   int i;
   fp = fopen("/var/mnt/testfile","w");
   for(i =0 ; i < 100000 ; i++)
   {
   fputs("xxxx", fp);
   fseek(fp, -4, SEEK_CUR);
   fputs("xx", fp);
  }
   fclose(fp);
}

  JFFS2 is mounted on /var/mnt. While the program is
running I am getting CRC errors like this:

Data CRC 6c48916e != calculated CRC 11ebde1b for node
at 000e0a68
  
   If  I am not doing fseek above and just add writing
to file in the loop I dont see any CRC errors.
   Pleae let me know what is happening here. Is JFFS2
running out of buffers or something?
   BTW I am using uclinux2.4.24 JFFS2.2 on a ARM7
board

Regards
Syed




__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
