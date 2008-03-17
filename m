Received: from parabel.levigo.net ([62.206.214.16] helo=parabel.matrix.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JbBs7-0003HJ-92
	for linux-mtd@lists.infradead.org; Mon, 17 Mar 2008 09:43:12 +0000
Message-ID: <47DE3D1B.7050007@gdsys.de>
Date: Mon, 17 Mar 2008 10:42:51 +0100
From: Dirk Eibach <eibach@gdsys.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2: filesystem corruption caused by writing and powercycle
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have  a problem with jffs2 filesystem corruption.=20
My environment is kernel 2.6.23.4, running on PPC.=20
Flash is Spansion 29GL512 NOR-Flash.

The problem can be reproduced simply by turning off power while writing.
After 3 or 4 powercycles I get errormessages when trying to copy the file=
 I wrote before turning off power:

/ # cp /data/tst /data/tst2
Data CRC ee9173b1 !=3D calculated CRC 6af6806d for node at 0221f108
cp: read error: Input/output error
/ #=20


This is my code to reproduce the problem:

#include <cstdlib>
#include <iostream>
#include <fcntl.h>
#include <errno.h>

#define MAXDATASIZE 10000.0
#define MINDATASIZE 10.0

int doStressTest (std::string filename)
{
  std::string data;
  int dataSize;

  int fd;
  fd =3D open(filename.c_str(), O_CREAT | O_RDWR);
  if ( fd =3D=3D -1 ) {
    std::cerr << "Open file failed." << std::endl;
    return 1;
  }
 =20
  data =3D std::string("");
  // Create random data
  for ( int i=3D0; i < MAXDATASIZE; i++ )
    data.push_back(1+rand()%255);

  for(;;) {
    dataSize =3D (int)(MINDATASIZE+(MAXDATASIZE-MINDATASIZE+1)*rand()/RAN=
D_MAX);

    std::cout << "Write " << dataSize << " bytes..." << std::endl;
    if ( write(fd, data.data(), dataSize) !=3D dataSize ) {
      std::cerr << "Write data failed: " << strerror(errno) << std::endl;
      return 1;
    }

  }

  close(fd);
  return 0;
}


int main (int argc, char **argv)
{
  if ( argc < 2 ) {
    std::cerr << "usage: stresstest <FILENAME>" << std::endl;
    exit(EXIT_FAILURE);
  }

  std::cout << "Stresstest running..." << std::endl;

  return doStressTest (std::string(argv[1]));
}


Cheers
--=20
Dirk Eibach
Entwicklung
Guntermann & Drunck GmbH Systementwicklung

Telefon: +49 2739 8901-100
Fax:     +49 2739 8901-120
EMail:   mailto:eibach@gdsys.de

-------------------------------------------------------------------------=
------
Guntermann & Drunck GmbH Systementwicklung=20
Dortmunder Str. 4a=20
D-57234 Wilnsdorf - Germany=20
Tel: +49 (0) 27 39 / 89 01 - 100  Fax: +49 (0) 27 39 / 89 01 - 120=20
E-Mail: mailto:sales@gdsys.de Web: www.gdsys.de
-------------------------------------------------------------------------=
------
Gesch=E4ftsf=FChrer: Udo Guntermann - Martin Drunck - Reiner Ruelmann - K=
laus Tocke
HRB 2884, Amtsgericht Siegen
USt.-Id.-Nr. DE 126575222 - Steuer-Nr. 342 / 5835 / 1041
-------------------------------------------------------------------------=
------
